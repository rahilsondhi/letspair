# == Schema Information
#
# Table name: topics
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  github_id    :integer
#  github_owner :string(255)
#  github_name  :string(255)
#  language     :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Topic < ActiveRecord::Base
  #
  # Associations
  #

  has_and_belongs_to_many :users
  has_and_belongs_to_many :sessions
  has_and_belongs_to_many :needs

  #
  # Validations
  #

  validates :name,
            presence: true,
            uniqueness: true

  validates :github_id,
            uniqueness: true

  #
  # Misc
  #

  attr_accessible :github_id, :github_name, :github_owner, :language, :name
end
