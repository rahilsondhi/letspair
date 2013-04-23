class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.belongs_to :user, null: false
      t.integer :partner_id, null: false
      t.integer :need_id
      t.integer :waiting_for
      t.string :state
      t.text :description
      t.datetime :date
      t.datetime :date_suggested_one
      t.datetime :date_suggested_two
      t.datetime :date_suggested_three

      t.timestamps
    end
    add_index :sessions, :user_id
    add_index :sessions, :partner_id
    add_index :sessions, :need_id
    add_index :sessions, :state
  end
end
