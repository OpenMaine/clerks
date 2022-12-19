json.extract! committee, :id, :election_id, :name, :street, :city, :telephone, :email, :office, :created_at, :updated_at
json.url committee_url(committee, format: :json)
