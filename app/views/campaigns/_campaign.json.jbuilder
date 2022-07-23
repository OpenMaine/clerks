json.extract! campaign, :id, :election_id, :name, :street, :city, :telephone, :email, :office, :created_at, :updated_at
json.url campaign_url(campaign, format: :json)
