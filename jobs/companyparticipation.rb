require 'net/http'
require 'json'

SCHEDULER.every '1d', :first_in => 0 do |job|
  company_participation = "24"
  company_morale = "8.1"

  send_event('company_participation',   { value: company_participation })
  send_event('company_morale', { value: company_morale })

end
