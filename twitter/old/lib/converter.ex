defmodule Converter do
	
	def to_nearest_tenth(val) when is_integer(val) or is_float(val) do
		Float.ceil(val, 1)
	end

	def to_km(val) when is_integer(val) or is_float(val), do: val / 1000

	def to_meters(km) when is_integer(km) or is_float(km), do: km * 1000

	def seconds_to_hours(sec) when is_integer(sec) or is_float(sec) do
		sec / 3600 |> to_nearest_tenth
	end

	def hours_to_seconds(hours) when is_integer(hours) or is_float(hours) do
		hours * 3600
	end

	def to_light_seconds({unit, val}, precision: precision)
	when is_integer(val) or is_float(val) do
		case unit do
		:miles -> from_miles(val)
		:meters -> from_meters(val)
		:feet -> from_feet(val)
		:inches -> from_inches(val)
		end |> round_to(precision)
  	end

	def round_to(val) when is_integer(val), do: round(val + 0.5)

	def round_to(val, precision) when is_float(val), do: Float.round(val, precision)

	defp from_miles(val), do: val * 5.36819e-6
	defp from_meters(val), do: val * 3.335638620368e-9
	defp from_feet(val), do: val * 1.016702651488166404e-9
	defp from_inches(val), do: val * 8.472522095734715723e-11
end
