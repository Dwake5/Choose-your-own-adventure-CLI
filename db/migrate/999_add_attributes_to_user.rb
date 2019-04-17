class AddAtrributesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :user, :energy, :integer
    add_column :user, :stress, :integer
    add_column :user, :knowledge, :integer
  end
end
