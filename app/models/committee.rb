class Committee < ApplicationRecord
  belongs_to :election
  has_many :contributions
  has_many :contributors, through: :contributions
end
