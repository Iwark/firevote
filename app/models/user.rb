# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  team_id    :integer          not null
#  ip_address :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  belongs_to :team
  has_many :votes

  validates :name, presence: true, uniqueness: true
  validates :team_id, presence: true
  validates :ip_address, presence: true, uniqueness: true

end
