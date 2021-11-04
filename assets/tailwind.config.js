module.exports = {
  mode: "jit",
  purge: ["../lib/*_web/**/*.*ex", "./js/**/*.js", "../lib/*_web/**/*.sface"],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
