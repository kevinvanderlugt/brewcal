class AddHiddenToBrews < ActiveRecord::Migration
  def change
    add_column :brews, :hidden, :boolean, default: false
  end
end
