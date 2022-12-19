class Election < ApplicationRecord
  has_many :campaigns
  has_many :committees
end
