module CampaignsHelper
include ActionView::Helpers

def format_money(amt)
    number_to_currency(amt/100, unit: "$")
end


end
