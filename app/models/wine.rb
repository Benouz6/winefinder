class Wine < ApplicationRecord
  has_many :food_pairings, dependent: :destroy
  has_many :foods, through: :food_pairings
  has_many :inventories
  has_many :stores, through: :inventories

  validates :name, :region, :description, :color, presence: true
  validates :saq_id, :price, presence: true, numericality: { only_integer: true }
end
