require 'sinatra'
require 'twitter'

# requirements: gem install sinatra twitter
# usage: ruby twitter.rb

# These environment variables are required
# go to https://dev.twitter.com/ for more info
ENV.fetch('TWITTER_CONSUMER_KEY')
ENV.fetch('TWITTER_CONSUMER_SECRET')
ENV.fetch('TWITTER_OAUTH_TOKEN')
ENV.fetch('TWITTER_OAUTH_TOKEN_SECRET')

get '/twitter/:username' do
  user = params.fetch 'username'

  tweets = Twitter.user_timeline(user, count: 200)

  tweets_by_hour = tweets.group_by{ |tweet| tweet.created_at.hour}

  frequencies = Hash.new(0)
  tweets_by_hour.each do |hour, tweets|
    frequencies[hour] = tweets.count
  end

  header = "<h1>Tweets for #{user}</h1>"

  histogram = (0..23).map do |hour|
    "#{hour} #{'#' * frequencies[hour]}"
  end.join("<br/>")

  header + histogram
end
