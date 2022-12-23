class CampaignReport < ApplicationRecord
  belongs_to :campaign
  has_many :campaign_schedule_as
  has_many :campaign_schedule_a1s
  has_many :campaign_schedule_bs
  has_many :campaign_schedule_cs
  has_many :campaign_schedule_ds
  has_one  :campaign_schedule_f

  enum :report_type, [:"January Semiannual", :"July Semiannual",
                      :"42-Day Pre-Election", :"11-Day Pre-Election",
                      :"42-Day Post-Election", :Other]
end
