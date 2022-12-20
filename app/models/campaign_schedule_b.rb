class CampaignScheduleB < ApplicationRecord
  belongs_to :campaign_report

  enum :schedule_b_type, [:APP, :CNS, :CON, :EQP, :EVT, :FOD, :HRD, :LIT, :MHS, :OFF, :ONL, :OTH, :PER, :PHO, :POL, :POS, :PRO, :RAD, :TKT, :TVN, :WEB]

  def type_description
    description = {
      "PRO" => "Professional services",
      "RAD" => "Radio ads and production",
      "TKT" => "Entrance cost to events",
      "TVN" => "TV/Cable ads",
      "WEB" => "Website and internet costs",
      "OTH" => "Other and fees",
      "PER" => "Personnel and campaign staff",
      "PHO" => "Phones",
      "POL" => "Polling and survey research",
      "POS" => "Postage for US Mail",
      "HRD" => "Hardware and small tools",
      "LIT" => "Printed campaign materials",
      "MHS" => "Mail house and direct mail",
      "OFF" => "Office supplies, rent, utilities, internet service, data",
      "ONL" => "Social media and online advertising only",
      "APP" => "Apparel",
      "CON" => "Contribution to party committee, non-profit, other",
      "EQP" => "Equipment of $50 or more",
      "EVT" => "Campaign and fundraising events",
      "FOD" => "Food for campaign events or volunteers, catering"
    }

    description[self.schedule_b_type]
  end

end
