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
  #
  # Assocations
  #

  belongs_to  :author,
              class_name: 'User',
              foreign_key: 'author_id',
              inverse_of: :authored_messages

  belongs_to  :recipient,
              class_name: 'User',
              foreign_key: 'recipient_id',
              inverse_of: :recipent_messages

  belongs_to  :session,
              inverse_of: :messages

  #
  # Validations
  #

  validates :author_id,
            presence: true

  validates :recipient_id,
            presence: true

  validates :session_id,
            presence: true

  validates :body,
            presence: true

  #
  # Misc
  #

  attr_accessible :author_id, :body, :recipient_id, :session_id
end
