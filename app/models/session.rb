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
  belongs_to :user
  attr_accessible :date_suggested_one, :date_suggested_three, :date_suggested_two, :description, :need_id, :partner_id, :state, :waiting_for
end
