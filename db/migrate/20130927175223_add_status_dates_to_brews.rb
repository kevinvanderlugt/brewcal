class AddStatusDatesToBrews < ActiveRecord::Migration
  def change
    add_column :brews, :planned_date, :date
    add_column :brews, :brewed_on, :date
    add_column :brews, :tapped_on, :date
  end
end
