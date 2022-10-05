class Campaign < ApplicationRecord
  belongs_to :election
  has_many :campaign_reports

  enum :office, [:Mayor, :"City Council", :"School Board"]

  scope :filter_by_location, -> (location_filter) { where city: location_filter }
  scope :filter_by_election, -> (election_filter) { where election: election_filter }
  scope :filter_by_office, -> (office_filter) { where office: office_filter }

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
  
end
