defmodule DanielWeb.PageController do
  use DanielWeb.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
