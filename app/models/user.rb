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

  has_many  :credentials,
            inverse_of: :user

  has_many  :authored_messages,
            class_name: 'Message',
            foreign_key: 'author_id',
            inverse_of: :author

  has_many  :recipient_messages,
            class_name: 'Message',
            foreign_key: 'recipient_id',
            inverse_of: :recipient

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
            presence: true,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ },
            uniqueness: { case_sensitive: false }

  validates :username,
            presence: true,
            format: { with: /\A[a-z0-9A-Z]+((\.|_)[a-z0-9A-Z]+)*/ },
            length: { maximum: 40 },
            uniqueness: { case_sensitive: false },
            exclusion:  {
              in: Rails.application.routes.routes.map{|r| r.path.spec.to_s.split('(').first.split('/').second}.compact.uniq,
              message: 'invalid'
            }

  validates :name,
            presence: true,
            length: { maximum: 255 }

  validates :timezone,
            presence: true

  #
  # Misc
  #

  attr_accessible :email, :last_online, :location, :name, :timezone, :username
end
