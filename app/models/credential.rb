class Credential < ActiveRecord::Base
  belongs_to :user
  attr_accessible :provider, :token, :uid, :username
end
