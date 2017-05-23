defmodule DanielWeb.EventController do
	use DanielWeb.Web, :controller

	def show(conn, %{"id" => id}) do
		event = DanielApi.EventQueries.get_by_id(id)
			|> IO.inspect()

    	render conn, "details.html", event: event
  	end

end
