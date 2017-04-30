defmodule PhysicsTest do
	use ExUnit.Case, async: true
	doctest Physics

	test "escape velocity of earth is correct" do
		ev = Physics.Rocketry.escape_velocity(:earth)
		assert ev == 11.2
	end

	test "escape velocity of mars is correct" do
		ev = Physics.Rocketry.escape_velocity(:mars)
		assert ev == 5.1
	end

	test "escape velocity of moon is correct" do
		ev = Physics.Rocketry.escape_velocity(:moon)
		assert ev == 2.4
	end

	test "escape velocity of planet X is correct" do
		ev = %{mass: 4.0e22, radius: 6.21e6}
			|> Physics.Rocketry.escape_velocity
		assert ev == 1.0
	end

	test "Orbital acceleration for earth at 100km" do
		orbital_acc = 100 |> Physics.Rocketry.orbital_acceleration
		assert orbital_acc == 9.515619587729839
    end

	test "Orbital term for 6419.992608113231km above earth" do
		term = 6419.992608113231 |> Physics.Rocketry.orbital_term
		assert term == 4
    end

	test "Find right height for 4 hours" do
		height = 4 |> Physics.Rocketry.orbital_height
		assert height == 6419.992608113231
    end

end
