require 'net/http'
require 'json'

SCHEDULER.every '30m', :first_in => 0 do |job|
  http = Net::HTTP.new "lightsaberaward.com"
  request = http.request Net::HTTP::Get.new("/employees.json")
  website = JSON.parse(request.body)
  result = Array.new

  website.each do |app|
    result.push({
      label: app["full_name"],
      value: app["count_by_employee"]
      })
  end

  send_event('counter', { items: result } )

  end