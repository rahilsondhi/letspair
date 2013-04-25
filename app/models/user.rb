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
  attr_accessible :email, :last_online, :location, :name, :timezone, :username
end
