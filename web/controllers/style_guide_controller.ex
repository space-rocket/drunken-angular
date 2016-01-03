defmodule DrunkenAngular.StyleGuideController do
  use DrunkenAngular.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
