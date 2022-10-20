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

  def cash_contributions_all
    sum = 0

    for report in self.campaign_reports.all do
      for schedule_a in report.campaign_schedule_as
        unless !schedule_a.description.nil?
          sum += schedule_a.amount
        end
      end
    end

    format_money(sum)
  end

  def in_kind_contributions_all
    sum = 0

    for report in self.campaign_reports.all do
      for schedule_a in report.campaign_schedule_as
        unless schedule_a.description.nil?
          sum += schedule_a.amount
        end
      end
    end

    format_money(sum)
  end

  def loan_balance_all
    sum = 0

    for report in self.campaign_reports.all do
      for schedule_c in report.campaign_schedule_cs
        sum += schedule_c.balance
      end
    end

    format_money(sum)
  end

  def most_recent_cash_balance
    format_money(self.campaign_reports.order('report_type')[-1].campaign_schedule_f.balance)
  end

end
