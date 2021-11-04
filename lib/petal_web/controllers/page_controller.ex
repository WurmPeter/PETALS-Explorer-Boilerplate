defmodule PetalWeb.PageController do
  alias Explorer.Datasets
  alias Explorer.DataFrame, as: DF
  alias Explorer.Series

  use PetalWeb, :controller

  def index(conn, _params) do
    df = Datasets.fossil_fuels()
    col_names = DF.names(df)

    for row_number <- 0..(DF.n_rows(df) - 1) do
      for col_number <- 0..(DF.n_cols(df) - 1) do
        # IO.inspect(df[Enum.at(DF.names(df), col_number)][row_number])
      end
    end

    render(conn, "index.html")
  end
end
