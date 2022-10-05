class CampaignScheduleB < ApplicationRecord
  belongs_to :campaign_report

  enum :schedule_b_type, [:APP, :CNS, :CON, :EQP, :EVT, :FOD, :HRD, :LIT, :MHS, :OFF, :ONL, :OTH, :PER, :PHO, :POL, :POS, :PRO, :RAD, :TKT, :TVN, :WEB]

end
