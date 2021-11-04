defmodule PetalWeb.Components.SortableList do
  @moduledoc false
  use Surface.LiveComponent

  prop list, :list

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  defp order_list(socket, sort_order) do
    new_list = socket.assigns.list |> Enum.sort(sort_order)

    socket
    |> assign(list: new_list)
  end

  def handle_event("asc", _value, socket) do
    socket = socket |> order_list(:asc)
    {:noreply, socket}
  end

  def handle_event("desc", _value, socket) do
    socket = socket |> order_list(:desc)
    {:noreply, socket}
  end
end
