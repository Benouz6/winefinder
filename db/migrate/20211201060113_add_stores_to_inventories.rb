class AddStoresToInventories < ActiveRecord::Migration[6.0]
  def change
    add_reference :inventories, :store, null: false, foreign_key: true
  end
end
