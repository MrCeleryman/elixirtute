defmodule FileReaderTest do 
	use ExUnit.Case

	import TuteTweet.FileReader
	import Mock

	test "Passing a file should return a string" do 
		str = get_strings_to_tweet(
			Path.join("#{:code.priv_dir(:tute_tweet)}", "sample.txt")
		)
		assert str !== nil
	end

	test "Will not return a string larger than 140 chars" do 
		str = get_strings_to_tweet(
			Path.join("#{:code.priv_dir(:tute_tweet)}", "test/too_long.txt")
		)
		assert str === "short line"
	end

	test "Empty string return empty string" do 
		str = pick_string("")

		assert str === ""
	end

	test "Shouldbe trimmed" do 
		with_mock File, [read!: fn(_) -> " ABC " end] do 
			str= get_strings_to_tweet("whatever")
			assert str === "ABC"
		end
	end
end