require 'net/http'
require 'json'

team_participation = [{"Team"=>"Ada","Participation"=>56},
{"Team"=>"Ajax","Participation"=>38},
{"Team"=>"Architect","Participation"=>2},
{"Team"=>"Apollo","Participation"=>8},
{"Team"=>"Argus","Participation"=>14},
{"Team"=>"Atlas","Participation"=>87},
{"Team"=>"Management","Participation"=>0},
{"Team"=>"Avalon","Participation"=>24},
{"Team"=>"Nine","Participation"=>37},
{"Team"=>"PM","Participation"=>0},
{"Team"=>"Research","Participation"=>0},
{"Team"=>"PO","Participation"=>0},
{"Team"=>"ScrumMaster","Participation"=>63},
{"Team"=>"Tron","Participation"=>68},
{"Team"=>"Zeus","Participation"=>11}].to_json

parsed = JSON.parse team_participation


SCHEDULER.every '10m', :first_in => 0 do |job|

  random_team = parsed.sample
  team_name = random_team['Team'] 
  title = team_name + " Team Morale Participation"

  send_event('team_participation', { title: title, value: random_team['Participation'] })

end
