class CampaignReport < ApplicationRecord
  belongs_to :campaign

  enum :report_type, [:"January Semiannual", :"July Semiannual",
                      :"42-Day Pre-Election", :"11-Day Pre-Election",
                      :"42-Day Post-Election", :Other]
end
