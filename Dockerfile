###
### Fist Stage - Building the Release
###
FROM hexpm/elixir:1.12.3-erlang-24.1.4-alpine-3.14.2 AS build

# This step installs all the build tools we'll need
RUN apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache \
    git \
    curl \
    build-base \
    libgcc  && \
    mix local.rebar --force && \
    mix local.hex --force

# install rustup
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV RUSTUP_HOME=/root/.rustup \
    RUSTFLAGS="-C target-feature=-crt-static" \
    CARGO_HOME=/root/.cargo  \
    PATH="/root/.cargo/bin:$PATH"

# prepare build dir
WORKDIR /app

# extend hex timeout
ENV HEX_HTTP_TIMEOUT=20

# set build ENV as prod
ENV MIX_ENV=prod
ENV SECRET_KEY_BASE=nokey

# Copy over the mix.exs and mix.lock files to load the dependencies. If those
# files don't change, then we don't keep re-fetching and rebuilding the deps.
COPY mix.exs mix.lock ./
COPY config config


# install build dependencies
RUN apk add --no-cache build-base npm

RUN mix deps.get --only prod && \
    mix deps.compile

# install npm dependencies
COPY assets/package.json assets/package-lock.json ./assets/
RUN npm --prefix ./assets ci --progress=false --no-audit --loglevel=error

COPY priv priv
COPY assets assets

# NOTE: If using TailwindCSS, it uses a special "purge" step and that requires
# the code in `lib` to see what is being used. Uncomment that here before
# running the npm deploy script if that's the case.
COPY lib lib

# build assets
RUN npm run --prefix ./assets deploy
RUN mix phx.digest

# copy source here if not using TailwindCSS
# COPY lib lib

# compile and build release
COPY rel rel
RUN mix do compile, release

###
### Second Stage - Setup the Runtime Environment
###

# prepare release docker image
FROM alpine:3.14.2 AS app
RUN apk add --no-cache libstdc++ openssl ncurses-libs

RUN apk update && \
    apk add --no-cache \
    bash \
    libgcc \
    openssl-dev

WORKDIR /app

RUN chown nobody:nobody /app

USER nobody:nobody

COPY --from=build --chown=nobody:nobody /app/_build/prod/rel/petal ./

ENV HOME=/app
ENV MIX_ENV=prod
ENV SECRET_KEY_BASE=nokey
ENV PORT=4000

CMD ["bin/petal", "start"]
