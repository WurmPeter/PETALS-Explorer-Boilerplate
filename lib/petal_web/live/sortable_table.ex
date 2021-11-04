defmodule PetalWeb.Live.SortableTable do
  @moduledoc false
  use Surface.LiveView

  alias PetalWeb.Components.SortableTable
  alias Explorer.Datasets, as: DS
  alias Explorer.DataFrame, as: DF

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~F"""
    <div>
      <SortableTable id="cTable1" table={DF.head(DS.fossil_fuels())}/>
    </div>
    """
  end
end
