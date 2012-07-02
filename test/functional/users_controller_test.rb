require 'test_helper'
require 'pp'

class UsersControllerTest < ActionController::TestCase

	def setup
		@user = User.new(name: "John Doe", 
									   email: "example@example.com",
									   password: "foobar3",
									   password_confirmation: "foobar3")
	end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:user)
  end

  test "should create user" do
		assert_difference('User.count') do
    	post :create, user: { name: "John Doe", 
									   email: "example@example.com",
									   password: "foobar3",
									   password_confirmation: "foobar3" }
  	end

 		assert_redirected_to user_path(assigns(:user))
 		assert_equal 'User Created!', flash[:success]
	end

	test "should not create user" do
		assert_difference('Question.count',0) do
	  	post :create, user: {}
		end
	 	assert_template 'new'
	end

end
