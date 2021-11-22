class Wine < ApplicationRecord
  has_many :foods
  has_many :inventories
end
