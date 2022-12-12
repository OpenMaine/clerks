class Contributor < ApplicationRecord
    has_many :contributions
    has_many :campaigns, through: :contributions
    has_many :committees, through: :contributions
end
