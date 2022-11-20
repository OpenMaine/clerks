module CampaignReportsHelper
  def format_money(amt)
    if amt != nil
      number_to_currency(amt/100, unit: "$")
    else
      "NA"
    end
  end
end
