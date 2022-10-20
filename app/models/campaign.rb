class Campaign < ApplicationRecord
  belongs_to :election
  has_many :campaign_reports

  enum :office, [:Mayor, :"City Council", :"School Board", :"Charter Commission"]

  scope :filter_by_location, -> (location_filter) { where city: location_filter }
  scope :filter_by_election, -> (election_filter) { where election_id: election_filter }
  scope :filter_by_office, -> (office_filter) { where office: office_filter }

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end

  def format_money(amt)
    "$#{amt/100}.#{"%.02d" % (amt%100)}"
  end

  def expenditures_schedule_f_all
    sum = 0

    for report in self.campaign_reports.all do
      sum += report.campaign_schedule_f.payments
    end

    format_money(sum)
  end

  def contributions_schedule_f_all
    sum = 0

    for report in self.campaign_reports.all do
      sum += report.campaign_schedule_f.receipts
    end

    format_money(sum)
  end



end
