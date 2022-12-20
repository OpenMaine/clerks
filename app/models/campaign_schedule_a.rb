class CampaignScheduleA < ApplicationRecord
  belongs_to :campaign_report

  def type_description
    description = {
      1 => "Candidate or Candidate Spouse/Domestic Partner",
      2 => "Other Individuals",
      3 => "Commercial Sources",
      4 => "Political Action Committees",
      5 => "Political Party Committees",
      6 => "Other Candidates and Committees",
      7 => "Contributors giving $50 or less",
      8 => "Transfer from previous campaign"
    }

    description[self.schedule_a_type]
  end

end
