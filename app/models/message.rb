# == Schema Information
#
# Table name: messages
#
#  id           :integer          not null, primary key
#  author_id    :integer          not null
#  recipient_id :integer          not null
#  session_id   :integer          not null
#  body         :text             not null
#  created_at   :datetime         not null
#

class Message < ActiveRecord::Base
  attr_accessible :author_id, :body, :recipient_id, :session_id
end
