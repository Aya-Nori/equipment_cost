class CreateEquipment < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment do |t|
      t.string :equipment_name, null: false
      t.date :start_time
      t.date :finish_time
      t.string :category, null: false
      t.timestamps
    end
  end
end
