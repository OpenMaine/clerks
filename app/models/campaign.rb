class Campaign < ApplicationRecord
  belongs_to :election
  has_many :campaign_reports
  has_many :contributions
  has_many :contributors, through: :contributions

  enum :office, [:Mayor, :"City Council", :"School Board", :"Charter Commission"]

  scope :filter_by_location, -> (location_filter) { where city: location_filter }
  scope :filter_by_election, -> (election_filter) { where election_id: election_filter }
  scope :filter_by_office, -> (office_filter) { where office: office_filter }

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end

  def expenditures_schedule_f_all
    sum = 0

    for report in self.campaign_reports.all do
      if !report.campaign_schedule_f.nil?
        sum += report.campaign_schedule_f.payments
      end
    end

    ApplicationController.helpers.format_money(sum)
  end

  def contributions_schedule_f_all
    sum = 0

    for report in self.campaign_reports.all do
      if !report.campaign_schedule_f.nil?
        sum += report.campaign_schedule_f.receipts
      end
    end

    ApplicationController.helpers.format_money(sum)
  end

  def cash_contributions_all
    sum = 0

    for report in self.campaign_reports.all do
      for schedule_a in report.campaign_schedule_as
        if !schedule_a.amount.nil?
          sum += schedule_a.amount
        end
      end
    end

    ApplicationController.helpers.format_money(sum)
  end

  def in_kind_contributions_all
    sum = 0

    for report in self.campaign_reports.all do
      for schedule_a in report.campaign_schedule_as
        if !schedule_a.amount.nil?
          sum += schedule_a.amount
        end
      end
    end

    ApplicationController.helpers.format_money(sum)
  end

  def loan_balance_all
    sum = 0

    for report in self.campaign_reports.all do
      for schedule_c in report.campaign_schedule_cs
        sum += schedule_c.balance
      end
    end

    ApplicationController.helpers.format_money(sum)
  end

  def most_recent_cash_balance
    ApplicationController.helpers.format_money(self.campaign_reports.order('report_type')[-1].campaign_schedule_f.balance) if !self.campaign_reports.order('report_type')[-1].campaign_schedule_f.nil?
  end

  def top_contributors_all
    schedule_as_list = []
    
    for report in self.campaign_reports do
      for schedule in report.campaign_schedule_as do
        schedule_as_list.push(schedule)
      end
    end

    schedule_as_list = schedule_as_list.group_by(&:name).map do |name, items|
      {
        amount: ApplicationController.helpers.format_money(items.sum(&:amount)),
        name: name
      }
    end

    schedule_as_list.sort_by { |i| -i[:amount].scan(/\d+/).first.to_i }
  end

end
