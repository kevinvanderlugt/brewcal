class AddStatusToBrews < ActiveRecord::Migration
  def change
    add_column :brews, :status, :string
  end
end
