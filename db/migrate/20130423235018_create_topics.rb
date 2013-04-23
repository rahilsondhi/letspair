class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name, null: false
      t.integer :github_id
      t.string :github_owner
      t.string :github_name
      t.string :language

      t.timestamps
    end
  end
end
