require 'net/http'
require 'json'

pictures = "https://s3-us-west-2.amazonaws.com/here-pics/uploads/RT_L+WordCloud.jpg"

SCHEDULER.every '20s', :first_in => 0 do |job|
  

  send_event('picture', { image: pictures } )

  end