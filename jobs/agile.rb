require 'net/http'
require 'json'

agile_principles = [{"value_more"=>"Individuals and Interactions ","value_less"=>"over processes and tools"},
{"value_more"=>"Working Software ","value_less"=>"over comprehensive documentation"},
{"value_more"=>"Customer Collaboration ","value_less"=>"over contract negotiation"},
{"value_more"=>"Responding to Change ","value_less"=>"over following a plan"}].to_json

parsed = JSON.parse agile_principles


SCHEDULER.every '2h', :first_in => 0 do |job|

  random_value = parsed.sample
  value_more = "We value " + random_value['value_more'] 
  value_other = random_value['value_less']

  send_event('agile_principles', { text: value_more, textbody: value_other })

end
