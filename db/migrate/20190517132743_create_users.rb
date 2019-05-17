class CreateUsers < ActiveRecord::Migration[5.1]
  def up
    create_table :users, id: :uuid do |t|
      t.string :name
      t.boolean :is_active

      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
