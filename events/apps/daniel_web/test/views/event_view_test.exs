defmodule DanielWeb.EventViewTest do 
	use DanielWeb.ConnCase, async: true

	@tag current: true
	test "Should convert date to D/M/YY format" do 
		date = Ecto.DateTime.from_erl({{2016, 12, 03}, {00, 00, 00}})
			|> DanielWeb.EventView.format_date 
		assert date == "3/12/2016"
	end
	
end
