class CreateStoriesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :stories do |t|
      t.string :name
    end
  end
end
