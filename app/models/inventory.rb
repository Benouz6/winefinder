class Inventory < ApplicationRecord
  belongs_to :store
  belongs_to :wine

  validates :bottle_count, numericality: { only_integer: true }
end
