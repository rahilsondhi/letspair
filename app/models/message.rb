class Message < ActiveRecord::Base
  attr_accessible :author_id, :body, :recipient_id, :session_id
end
