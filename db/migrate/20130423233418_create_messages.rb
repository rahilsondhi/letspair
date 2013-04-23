class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :author_id, null: false
      t.integer :recipient_id, null: false
      t.integer :session_id, null: false
      t.text :body, null: false
      t.timestamp :created_at, null: false
    end
    add_index :messages, :session_id
  end
end
