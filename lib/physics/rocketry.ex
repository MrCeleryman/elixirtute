defmodule Physics.Rocketry do
	import Converter
	import Calcs
	import Physics.Laws, only: [newtons_gravitational_constant: 0]
	import Planets

	def escape_velocity(:earth), do: earth() |> escape_velocity
	def escape_velocity(:mars), do: mars() |> escape_velocity
	def escape_velocity(:moon), do: moon() |> escape_velocity

	def escape_velocity(planet) when is_map(planet) do
		planet
			|> calculate_escape
			|> Converter.to_km
			|> Converter.to_nearest_tenth
	end

	def orbital_speed(height) do
		newtons_gravitational_constant() * earth().mass / orbital_radius(height)
			|> square_root
	end

	def orbital_acceleration(height) do
		(orbital_speed(height) |> squared) / orbital_radius(height)
	end

	def orbital_term(height) do
		4 * (:math.pi |> squared) * (orbital_radius(height) |> cubed) / (
			newtons_gravitational_constant() * earth().mass())
			|> square_root
			|> seconds_to_hours
    end

	def orbital_height(hours) when is_integer(hours) or is_float(hours) do
		newtons_gravitational_constant() * earth().mass * (hours |> hours_to_seconds |> squared) / (
			4 * (:math.pi |> squared))
			|> cube_root
			|> radius_from_surface
			|> to_km
	end

	defp orbital_radius(height) do
		earth().radius + (height |> to_meters)
	end

	defp radius_from_surface(height) do
		height - earth().radius
	end

	defp calculate_escape(%{mass: mass, radius: radius}) do
		2 * newtons_gravitational_constant() * mass / radius
			|> square_root
	end

end
