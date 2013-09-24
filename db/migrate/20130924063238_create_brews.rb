class CreateBrews < ActiveRecord::Migration
  def change
    create_table :brews do |t|
      t.string :title
      t.text :description
      t.string :recipe_url
      t.integer :dashboard_id
      t.float :og
      t.float :fg

      t.timestamps
    end
    add_index :brews, :dashboard_id
  end
end
