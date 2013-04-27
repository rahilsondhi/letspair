# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  email       :string(255)      not null
#  username    :string(255)      not null
#  name        :string(255)      not null
#  location    :string(255)
#  last_online :datetime
#  timezone    :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class User < ActiveRecord::Base
  #
  # Assocations
  #
  has_many  :credentials

  has_many  :authored_messages,
            class_name: 'Message',
            foreign_key: 'author_id'

  has_many  :recipient_messages,
            class_name: 'Message',
            foreign_key: 'recipient_id'

  has_many  :sessions

  has_many  :partnered_sessions,
            class_name: 'Session',
            foreign_key: 'partner_id'

  has_many  :needs

  has_and_belongs_to_many :topics

  #
  # Validations
  #
  validates :email,
            presence: true

  validates :username,
            presence: true

  validates :name,
            presence: true

  validates :timezone,
            presence: true

  #
  # Misc
  #
  attr_accessible :email, :last_online, :location, :name, :timezone, :username
end
