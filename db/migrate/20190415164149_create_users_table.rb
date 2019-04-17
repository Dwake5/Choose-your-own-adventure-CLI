class CreateUsersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :stress, default: 0
      t.integer :energy, default: 100
      t.integer :knowledge, default: 0
      t.timestamps
    end
  end
end
