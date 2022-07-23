json.extract! campaign_report, :id, :campaign_id, :type, :created_at, :updated_at
json.url campaign_report_url(campaign_report, format: :json)
