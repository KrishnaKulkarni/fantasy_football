json.extract! player, :id, :name, :position, :private_value, :public_value, :roster_id, :league_id, :created_at, :updated_at
json.url player_url(player, format: :json)
