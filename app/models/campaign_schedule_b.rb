class CampaignScheduleB < ApplicationRecord
  belongs_to :campaign_report

  enum :schedule_b_type, [:CNS,:CON,:EQP,:FND,:FOD,:LIT,:MHS,
                          :OFF,:OTH,:PHO,:POL,:POS,:PRO,:PRT,:RAD,
                          :SAL,:TRV,:TVN,:WEB, :ONL, :APP]
end
