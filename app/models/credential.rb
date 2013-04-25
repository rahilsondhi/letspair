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
  belongs_to :user
  attr_accessible :provider, :token, :uid, :username
end
