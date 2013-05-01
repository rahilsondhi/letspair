# == Schema Information
#
# Table name: credentials
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  provider   :string(255)      not null
#  uid        :integer          not null
#  token      :string(255)
#  username   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Credential < ActiveRecord::Base
  #
  # Assocations
  #

  belongs_to  :user,
              inverse_of: :credentials

  #
  # Validations
  #

  validates :provider,
            presence: true

  validates :uid,
            presence: true

  #
  # Misc
  #

  attr_accessible :provider, :token, :uid, :username
end
