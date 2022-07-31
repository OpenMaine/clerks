module CampaignReportSchedule
  extend ActiveSupport::Concern

  included do
    before_action :fetch_campaign_report, only: [:index]
  end

  private
  def fetch_campaign_report
    @campaign_report = CampaignReport.find(params[:campaign_report_id])
  end
end
