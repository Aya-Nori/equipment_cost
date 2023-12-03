class CreateEquipment < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment do |t|
      t.string :equipment_name, null: false
      t.string :category, null: false
      t.float :price, null: false
      t.timestamps
    end
  end
end