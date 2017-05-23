defmodule DanielWeb.EventController do
	use DanielWeb.Web, :controller

	def show(conn, %{"id" => id}) do
		event = DanielApi.EventQueries.get_by_id(id)
			|> IO.inspect()

    	render conn, "details.html", event: event
  	end

	def list(conn, _params) do 
		events = DanielApi.EventQueries.get_all
		render conn, "list.html", events: events
	end

end
