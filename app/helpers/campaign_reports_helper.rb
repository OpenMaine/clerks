module CampaignReportsHelper
  def format_money(amt)
    if amt != nil
      "$#{amt/100}.#{"%.02d" % (amt%100)}"
    else
      "NA"
    end
  end
end
