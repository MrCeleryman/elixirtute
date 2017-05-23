defmodule TuteTweet.Scheduler do
	def schedule_file(schedule, file) do 
		Quantum.add_job(schedule, fn -> 
			TuteTweet.FileReader.get_strings_to_tweet(file)
			|> TuteTweet.TweetServer.tweet end)
	end
end