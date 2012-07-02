# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#  remember_token  :string(255)
#

require 'test_helper'
require 'pp'

class UserTest < ActiveSupport::TestCase

	def setup
		@user = User.new(name: "John Doe", 
									   email: "example@example.com",
									   password: "foobar",
									   password_confirmation: "foobar")
	end

	test "valid user must be valid" do
		assert_respond_to @user, :name
		assert_respond_to @user, :email
		assert_respond_to @user, :password_digest   
		assert_respond_to @user, :password_confirmation
		assert_respond_to @user, :password
		assert_respond_to @user, :authenticate
		assert @user.valid?
	end

	test "name must not be blank" do
		@user.name = "         "
		assert !@user.valid?
	end

	test "name must not be nil" do
		@user.name = nil
		assert !@user.valid?
	end

	test "email must not be blank" do
		@user.email = "         "
		assert !@user.valid?
	end

	test "email must not be nil" do
		@user.email = nil
		assert !@user.valid?
	end

	test "name can't be longer than 50 chracters" do
		@user.name = "a" * 51
		assert !@user.valid?
	end


	test "password can't be shorter than 6 characters" do
		@user.password = "a" * 5
		assert !@user.valid?
	end

	test "invalid email addresses" do
		addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                   foo@bar_baz.com foo@bar+baz.com]
    addresses.each do |invalid_address|
    	@user.email = invalid_address
    	assert !@user.valid?
    end
	end

	test "valid email addresses" do
		addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
    addresses.each do |valid_address|
    	@user.email = valid_address
    	assert @user.valid?
    end
	end

	test "email address uniqueness regardless of case" do
    dup_user = User.new(name: "First Last", email: @user.email.upcase)
    assert ! dup_user.valid?
	end

	test "password must not be blank" do
		@user.password = @user.password_confirmation = "  "
		assert !@user.valid?
	end

	test "pasword mismatch" do
		@user.password = "invalid"
		assert !@user.valid?
	end

	test "password is set to nil" do
		@user.password = nil
		assert !@user.valid?
	end

	test "with valid password" do
		assert_same @user, @user.authenticate(@user.password)
	end

	test "with invalid password" do
		assert_not_same @user, @user.authenticate("invalid_password")
	end


end
