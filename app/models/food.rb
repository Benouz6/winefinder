class Food < ApplicationRecord
  has_many :food_pairings
  has_many :wines, through: :food_pairings

  validates :name, presence: true
end
