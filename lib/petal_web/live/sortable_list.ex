defmodule PetalWeb.Live.SortableList do
  @moduledoc false
  use Surface.LiveView

  alias PetalWeb.Components.SortableList

  def mount(_params, _session, socket) do
    {:ok, assign(socket, my_list: ["abc", "def"])}
  end

  def render(assigns) do
    ~F"""
     <div>
      <SortableList id="cList1" list={@my_list} />
      <SortableList id="cList2" list={["1", "2", "3", "4"]} />
    </div>
    """
  end
end
