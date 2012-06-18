require 'test_helper'
require 'pp'

class HolderTest < ActiveSupport::TestCase
 
  test "name can't be longer than 75 characters" do
 		name = "a" * 78
		longer_than_75 = Holder.new(name: name)
		assert !longer_than_75.valid?
  end

  test "description can't be longer than 250 characters" do
 		description = "a" * 251
		longer_than_250 = Holder.new(description: description)
		assert !longer_than_250.valid?	
  end

  test "name must be present" do
    holder = Holder.new(name: "name", user_id: 10)
    assert holder.valid?
  end

  test "name must not be blank" do
    holder = Holder.new(name: "    ")
    assert !holder.valid?
  end

  test "name must not be nil" do
    holder = Holder.new(name: nil)
    assert !holder.valid?
  end
  
  test "user_id must be present" do
    holder = Holder.new(user_id: 10, name: "name")
    assert holder.valid?
  end

  test "user_id must not be blank" do
    holder = Holder.new()
    assert !holder.valid?
  end

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

