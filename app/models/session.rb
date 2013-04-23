class Session < ActiveRecord::Base
  belongs_to :user
  attr_accessible :date_suggested_one, :date_suggested_three, :date_suggested_two, :description, :need_id, :partner_id, :state, :waiting_for
end
