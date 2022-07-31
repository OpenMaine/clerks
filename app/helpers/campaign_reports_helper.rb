module CampaignReportsHelper
  def format_money(amt)
    "$#{amt/100}.#{"%.02d" % (amt%100)}"
  end
end
