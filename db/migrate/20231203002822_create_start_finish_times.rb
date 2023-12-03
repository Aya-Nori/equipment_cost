class CreateStartFinishTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :start_finish_times do |t|
      t.date :start_time
      t.date :finish_time
      t.integer :condition, null: false
      t.integer :user_id, null: false
      t.integer :equipment_id, null: false
      t.timestamps
    end
  end
end
