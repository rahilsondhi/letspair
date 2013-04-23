class CreateCredentials < ActiveRecord::Migration
  def change
    create_table :credentials do |t|
      t.belongs_to :user, null: false
      t.string :provider, null: false
      t.integer :uid, null: false
      t.string :token
      t.string :username

      t.timestamps
    end
    add_index :credentials, :user_id
  end
end
