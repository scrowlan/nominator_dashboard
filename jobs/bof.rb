require 'net/http'
require 'json'

SCHEDULER.every '1h', :first_in => 0 do |job|
  http = Net::HTTP.new "lightsaberaward.com"
  request = http.request Net::HTTP::Get.new("/activities.json")
  website = JSON.parse request.body
  
  SCHEDULER.every '2m', :first_in => 0 do |job|
    random = website.sample
    random_nomination = []
    
    # random_nomination << { text: random['reason'], moreinfo: random['nominator'] }
    title = random['title']
    presenter = random['name']
    date = random['date']
   # nominator = random['nominator']
   # fname = random['employee']['fname']
    #lname = random['employee']['lname']
    #if random['nominator'] != ""
     # nominator = random['nominator']
   # else
    #  nominator = "anonymous"
    #end

    send_event('bof', { title: title, presenter: presenter, date: date} )

  end


end