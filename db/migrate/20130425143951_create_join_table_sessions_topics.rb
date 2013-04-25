class CreateJoinTableSessionsTopics < ActiveRecord::Migration
  def change
    create_table :sessions_topics, id: false do |t|
      t.integer :session_id
      t.integer :topic_id
    end
  end
end
