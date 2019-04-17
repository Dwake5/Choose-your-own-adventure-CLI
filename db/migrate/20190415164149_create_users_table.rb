class CreateUsersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :stress, default: 0
      t.integer :energy, default: 100
      t.integer :knowlede, default: 0
    end
  end
end
