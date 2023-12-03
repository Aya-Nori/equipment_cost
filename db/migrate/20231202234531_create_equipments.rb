class CreateEquipments < ActiveRecord::Migration[7.0]
  def change
    create_table :equipments do |t|
      t.string :equipment_name, null: false
      t.string :category, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end