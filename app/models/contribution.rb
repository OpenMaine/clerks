class Contribution < ApplicationRecord
  belongs_to :contributor
  belongs_to :campaign
  belongs_to :committee
end
