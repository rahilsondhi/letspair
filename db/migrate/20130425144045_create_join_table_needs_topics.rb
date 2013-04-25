class CreateJoinTableNeedsTopics < ActiveRecord::Migration
  def change
    create_table :needs_topics, id: false do |t|
      t.integer :need_id
      t.integer :topic_id
    end
  end
end
