json.extract! contribution, :id, :contributor_id, :campaign_id, :committee_id, :amount, :description, :created_at, :updated_at
json.url contribution_url(contribution, format: :json)
