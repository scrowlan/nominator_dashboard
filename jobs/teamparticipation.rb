require 'net/http'
require 'json'

team_participation = [{"Team"=>"Ada","Participation"=>57},
{"Team"=>"Ajax","Participation"=>34},
{"Team"=>"Architect","Participation"=>3},
{"Team"=>"Apollo","Participation"=>15},
{"Team"=>"Argus","Participation"=>22},
{"Team"=>"Atlas","Participation"=>60},
{"Team"=>"Management","Participation"=>4},
{"Team"=>"Avalon","Participation"=>47},
{"Team"=>"Nine","Participation"=>45},
{"Team"=>"PM","Participation"=>2},
{"Team"=>"Research","Participation"=>3},
{"Team"=>"PO","Participation"=>2},
{"Team"=>"ScrumMaster","Participation"=>67},
{"Team"=>"Tron","Participation"=>65},
{"Team"=>"Zeus","Participation"=>7}].to_json

parsed = JSON.parse team_participation


SCHEDULER.every '10m', :first_in => 0 do |job|

  random_team = parsed.sample
  team_name = random_team['Team'] 
  title = team_name + " Team Morale Participation"

  send_event('team_participation', { title: title, value: random_team['Participation'] })

end
