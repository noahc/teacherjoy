class Question < ActiveRecord::Base
  attr_accessible :answer, :question, :set_id

  validates_length_of :question, maximum: 250
  validates_length_of :answer, maximum: 140

  validates :question, presence: true
  validates :answer, presence: true



end
# == Schema Information
#
# Table name: questions
#
#  id         :integer         not null, primary key
#  question   :string(255)
#  answer     :string(255)
#  holder_id  :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

