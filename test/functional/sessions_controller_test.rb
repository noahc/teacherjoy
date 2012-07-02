require 'test_helper'
require 'pp'

class SessionsControllerTest < ActionController::TestCase

	test "should get new" do
		get :new
		assert_response :success
	end

	test "should create session" do
		user = User.create(name: "John Doe", 
									  email: "example@example.com",
									  password: "foobar",
									  password_confirmation: "foobar")
		post :create, {session: {email: user.email, password: user.password} }
		assert_redirected_to holders_path
	end

	test "should not create session" do
		user = User.create(name: "John Doe", 
									  email: "example@example.com",
									  password: "foobar",
									  password_confirmation: "foobar")
		post :create, {session: {email: user.email, password: "invalid_password"} }
		assert_template :new
	end

	test "should destroy" do
		user = User.create(name: "John Doe", 
									  email: "example@example.com",
									  password: "foobar",
									  password_confirmation: "foobar")
		cookies.permanent[:remember_token] = user.remember_token
		cookie = cookies[:remember_token]
		delete :destroy
		destroyed_cookie = cookies[:remember_token]
		assert_nil destroyed_cookie
		assert_not_equal cookie, destroyed_cookie

	end

 

end
