class CreateUsers < ActiveRecord::Migration[5.1]
  def up
    create_table :users, id: :uuid do |t|
      t.string :fullname
      t.boolean :is_active, default: true
      t.integer :role, default: 0

      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
