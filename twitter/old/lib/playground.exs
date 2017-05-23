defmodule Playground do 
	
	import IO, only: [puts: 1]
	import Kernel, except: [inspect: 1]

	require Integer

	def say_here do 
		inspect "Hello cuckboiiiiiiiii"
	end

	def inspect(arg) do 
		puts arg
	end

	def print_is_even(num) do 
		puts "Is #{num} even?"
		puts Integer.is_even(num)
	end
end