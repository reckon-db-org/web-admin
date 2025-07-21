defmodule WebAdminWeb.HomeLive do
  use WebAdminWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, page_title: "Admin")}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="flex flex-col items-center justify-center min-h-[60vh]">
      <h1 class="text-4xl font-bold mb-8 text-zinc-900">ExESDB Admin</h1>
      <.link
        navigate="/dev/dashboard"
        class="inline-flex items-center gap-2 px-6 py-3 bg-purple hover:bg-purple-dark text-white font-semibold rounded-lg transition-colors duration-200"
      >
        <.icon name="hero-chart-bar" class="h-5 w-5" />
        Open Developer Dashboard
      </.link>
    </div>
    """
  end
end
