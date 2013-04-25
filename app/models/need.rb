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
  belongs_to :user
  attr_accessible :date_suggested_one, :date_suggested_three, :date_suggested_two, :date_type, :description
end
