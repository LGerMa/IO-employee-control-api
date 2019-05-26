class CreateLaborTimes < ActiveRecord::Migration[5.1]
  def up
    create_table :labor_times, id: :uuid do |t|
      t.datetime :start_date, default: Time.now
      t.datetime :end_date, default: nil
      t.integer :labor_type, default: 0
      t.boolean :current_labor_time, default: true
      t.references :user, foreign_key: true, type: :uuid
      t.timestamps
    end
  end

  def down
    drop_table :labor_times
  end
end
