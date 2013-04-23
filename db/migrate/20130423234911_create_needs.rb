class CreateNeeds < ActiveRecord::Migration
  def change
    create_table :needs do |t|
      t.belongs_to :user, null: false
      t.string :date_type
      t.text :description
      t.datetime :date_suggested_one
      t.datetime :date_suggested_two
      t.datetime :date_suggested_three

      t.timestamps
    end
    add_index :needs, :user_id
  end
end
