require 'twitter'


#### Get your twitter keys & secrets:
#### https://dev.twitter.com/docs/auth/tokens-devtwittercom
twitter = Twitter::REST::Client.new do |config|
  config.consumer_key = 'TllPEw1xHAGM6FIcBo334MFPo'
  config.consumer_secret = 'zBif3pmG5nlGrtdg49vJoEPRnWNzFajenKDXXVPS91KAfnp4u9'
  config.access_token = '19160753-3NYOTXSqLri9OxDNVjo3SB0DqBLcPJ7JiPWcEaZWj'
  config.access_token_secret = 'fRlV65O6eAOdTsXyEWwR2Jq5dFmZQqc4iEhbJF2yBfMmQ'
end


SCHEDULER.every '1d', :first_in => 0 do |job|
  begin
    tweets = twitter.user_timeline("agilequote")

    if tweets
      tweets.map! do |tweet|
        { name: tweet.text, body: tweet.user.screen_name }
      end
      send_event('twitter_mentions', comments: tweets)
    end

  rescue Twitter::Error
    puts "\e[33mFor the twitter widget to work, you need to put in your twitter API keys in the jobs/twitter.rb file.\e[0m"
  end
end