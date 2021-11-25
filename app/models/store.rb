class Store < ApplicationRecord
  has_many :inventories

  validates :address, :name, presence: true
end
