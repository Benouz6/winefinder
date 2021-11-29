class Inventory < ApplicationRecord
  belongs_to :store
  belongs_to :wine

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :bottle_count, numericality: { only_integer: true }
end
