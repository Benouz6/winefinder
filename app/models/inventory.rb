class Inventory < ApplicationRecord
  belongs_to :wine
  belongs_to :store

  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?

  validates :bottle_count, numericality: { only_integer: true }
end
