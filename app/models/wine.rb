class Wine < ApplicationRecord
  monetize :price_cents
  has_many :food_pairings, dependent: :destroy
  has_many :foods, through: :food_pairings
  has_many :inventories
  has_many :stores, through: :inventories

  validates :name, :origin, :color, presence: true
  validates :saq_code, presence: true, numericality: { only_integer: true }
end
