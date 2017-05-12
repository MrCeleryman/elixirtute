defmodule Sample.Enum do

	def first(list, val \\ nil)
	def first([head | _], _), do: head
	def first([], val), do: val

	def add(list, val \\ 0) do
		trace(val)
		[val | list]
	end

	def map([], _), do: []
	def map([head | tail], f) do
		[f.(head) | map(tail, f)]
	end

	def lyrics(), do: lyrics(100..1)
	def lyrics(first..last) when first <= last do 
		IO.puts(first)
	end
	def lyrics(first..last) do 
		IO.puts(first) <> lyrics(first - 1..last)
	end

	defp trace(str) do 
		IO.puts "value passed in was #{str}"
	end
end