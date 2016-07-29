require 'net/http'
require 'json'

SCHEDULER.every '2h', :first_in => 0 do |job|
  http = Net::HTTP.new "lightsaberaward.com"
  request = http.request Net::HTTP::Get.new("/activities.json")
  website = JSON.parse request.body

  SCHEDULER.every '2h', :first_in => 0 do |job|
    activity = website.sample
    
    # random_nomination << { text: random['activity'], moreinfo: random['nominator'] }
    title = activity['title']
   # nominator = random['nominator']
    name = activity['name']
    date = activity['date']

    send_event('activity', { title: title, name: name, date: date} )
  end
end
