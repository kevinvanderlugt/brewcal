class AddNameToBrews < ActiveRecord::Migration
  def change
    add_column :brews, :name, :string
    remove_column :brews, :title
  end
end
