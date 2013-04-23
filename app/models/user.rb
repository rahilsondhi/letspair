class User < ActiveRecord::Base
  attr_accessible :email, :last_online, :location, :name, :timezone, :username
end
