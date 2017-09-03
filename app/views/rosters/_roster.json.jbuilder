json.extract! roster, :id, :name, :manager_id, :structure, :created_at, :updated_at
json.url roster_url(roster, format: :json)
