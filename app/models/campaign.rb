class Campaign < ApplicationRecord
  belongs_to :election
  has_many :campaign_reports

  enum :office, [:Mayor, :"City Council", :"School Board", :"Charter Commission"]
end
