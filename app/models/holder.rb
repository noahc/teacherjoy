class Holder < ActiveRecord::Base
  attr_accessible :description, :name, :user_id

  validates_length_of :name, maximum: 75
  validates_length_of :description, maximum: 250

  validates :name, presence: true
  #validates :user_id, presence: true
end
# == Schema Information
#
# Table name: holders
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  user_id     :integer
#  description :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

