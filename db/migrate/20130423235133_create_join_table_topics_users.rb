class CreateJoinTableTopicsUsers < ActiveRecord::Migration
  def change
    create_table :topics_users, id: false do |t|
      t.integer :topic_id
      t.integer :user_id
    end
  end
end
