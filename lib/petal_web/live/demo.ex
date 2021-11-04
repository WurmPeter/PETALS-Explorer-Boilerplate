defmodule PetalWeb.Live.Demo do
  @moduledoc false
  use Surface.LiveView

  alias PetalWeb.Components.Hero

  def render(assigns) do
    ~F"""
    <div>
      <Hero name="John Doe" subtitle="How are you?" color="info"/>
    </div>
    """
  end
end
