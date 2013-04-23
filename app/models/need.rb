class Need < ActiveRecord::Base
  belongs_to :user
  attr_accessible :date_suggested_one, :date_suggested_three, :date_suggested_two, :date_type, :description
end
