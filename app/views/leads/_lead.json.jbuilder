json.extract! lead, :id, :lat, :lng, :address, :pool_type, :kitchen_condition, :bathroom_condition, :renovated, :renovated_spent_cents, :renovated_description, :created_at, :updated_at
json.url lead_url(lead, format: :json)
