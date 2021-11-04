defmodule PetalWeb.Components.SortableTable do
  @moduledoc false
  use Surface.LiveComponent

  alias Explorer.Datasets
  alias Explorer.DataFrame, as: DF
  alias Explorer.Series

  prop table, :any

  data col_names, :list

  def mount(socket) do
    # col_names = DF.names(socket.assigns.table)

    # socket =
    #   socket
    #   |> assign(col_names: col_names)

    {:ok, socket}
  end
end
