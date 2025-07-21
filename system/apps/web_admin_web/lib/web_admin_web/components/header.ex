defmodule WebAdminWeb.Header do
  use WebAdminWeb, :live_component

  @impl true
  def render(assigns) do
    ~H"""
    <header class="px-3 sm:px-4 lg:px-8 bg-white shadow-sm sticky top-0 z-50">
      <div class="flex items-center justify-between border-b border-gray-200 py-3 sm:py-4">
        <div class="flex items-center gap-2 sm:gap-4">
          <a href="/" class="flex items-center">
            <img src={~p"/images/reckondb-logo.svg"} alt="ReckonDB" class="h-6 sm:h-8 mr-2 sm:mr-3" />
            <span class="text-lg sm:text-xl font-semibold text-gray-800">
              <%= assigns[:page_title] || "ExESDB Admin" %>
            </span>
          </a>
        </div>

        <div class="flex items-center gap-4">
          <nav class="hidden md:flex items-center gap-6 font-nav font-medium text-gray-700">
            <a href="/" class="hover:text-purple transition-colors duration-200">
              Home
            </a>
            <a href="/dev/dashboard" class="hover:text-purple transition-colors duration-200">
              Dashboard
            </a>
            <a href="https://github.com/reckon-db-org" class="hover:text-purple transition-colors duration-200">
              GitHub
            </a>
          </nav>
        </div>
      </div>
    </header>
    """
  end
end
