defmodule DanielWeb.EventView do
	use DanielWeb.Web, :view

	def format_date(date) do 
		{{y, m, d}, _} = Ecto.DateTime.to_erl(date)
		"#{d}/#{m}/#{y}"
	end

	def format_time(date) do 
		{_, {h, m, _}} = Ecto.DateTime.to_erl(date)
		"#{String.pad_leading("#{h}", 2, "0")}:#{String.pad_leading("#{m}", 2, "0")}"
	end
end