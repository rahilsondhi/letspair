class Topic < ActiveRecord::Base
  attr_accessible :github_id, :github_name, :github_owner, :language, :name
end
