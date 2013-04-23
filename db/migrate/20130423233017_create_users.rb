class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :username, null: false
      t.string :name, null: false
      t.string :location
      t.datetime :last_online
      t.string :timezone

      t.timestamps
    end
  end
end
