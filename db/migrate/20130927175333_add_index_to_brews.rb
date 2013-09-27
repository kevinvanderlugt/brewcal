class AddIndexToBrews < ActiveRecord::Migration
  def change
    add_index :brews, :status
  end
end
