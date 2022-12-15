module CampaignsHelper
include ActionView::Helpers

def format_money(amt)
    if amt.nil?
        return "$0.00"
    else
        number_to_currency(amt/100, unit: "$")
    end
end


end
