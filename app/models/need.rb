# == Schema Information
#
# Table name: needs
#
#  id                   :integer          not null, primary key
#  user_id              :integer          not null
#  date_type            :string(255)
#  description          :text
#  date_suggested_one   :datetime
#  date_suggested_two   :datetime
#  date_suggested_three :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Need < ActiveRecord::Base
  #
  # Constants
  #

  VALID_DATE_TYPES = %w(ongoing now specific)

  #
  # Assocations
  #

  has_many    :sessions,
              inverse_of: :need

  belongs_to  :user,
              inverse_of: :needs

  has_and_belongs_to_many :topics

  #
  # Validations
  #

  validates :user_id,
            presence: true

  validates :date_type,
            presence: true,
            inclusion: { in: VALID_DATE_TYPES }

  validates :description,
            presence: true

  #
  # Misc
  #

  attr_accessible :date_suggested_one, :date_suggested_three, :date_suggested_two, :date_type, :description
end
