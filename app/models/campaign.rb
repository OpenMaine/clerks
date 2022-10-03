class Campaign < ApplicationRecord
  belongs_to :election
  has_many :campaign_reports

  enum :office, [:Mayor, :"City Council", :"School Board"]

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
  
end
