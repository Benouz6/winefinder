class Inventory < ApplicationRecord
  belongs_to :store
  belongs_to :wine
end
