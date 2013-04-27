# == Schema Information
#
# Table name: sessions
#
#  id                   :integer          not null, primary key
#  user_id              :integer          not null
#  partner_id           :integer          not null
#  need_id              :integer
#  waiting_for_id       :integer
#  state                :string(255)
#  description          :text
#  date                 :datetime
#  date_suggested_one   :datetime
#  date_suggested_two   :datetime
#  date_suggested_three :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Session < ActiveRecord::Base
  #
  # Constants
  #

  VALID_STATES = %w(open waiting scheduled cancelled)

  #
  # Assocations
  #

  has_many    :messages,
              inverse_of: :session

  belongs_to  :user,
              inverse_of: :sessions

  belongs_to  :partner,
              class_name: 'User',
              foreign_key: 'partner_id',
              inverse_of: :partnered_sessions

  belongs_to  :need,
              inverse_of: :sessions

  belongs_to  :waiting_for,
              class_name: 'User',
              foreign_key: 'waiting_for_id'

  has_and_belongs_to_many :topics

  #
  # Validations
  #

  validates :user_id,
            presence: true

  validates :partner_id,
            presence: true

  validates :state,
            presence: true,
            inclusion: { in: VALID_STATES }

  #
  # Misc
  #

  attr_accessible :date_suggested_one, :date_suggested_three, :date_suggested_two, :description, :need_id, :partner_id, :state, :waiting_for
end
