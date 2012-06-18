require 'test_helper'

class HoldersControllerTest < ActionController::TestCase
  
 #  test "should get index" do
	#  	get :index
	#   assert_response :success
	#   assert_not_nil assigns(:holders)
	# end

	test "should get new" do
		get :new
		assert_response :success
		assert_not_nil assigns(:holder)
	end

	test "should create question" do
		assert_difference('Holder.count') do
    	post :create, holder: { name: 'apple', user_id: 10}
  	end

 		assert_redirected_to holder_path(assigns(:holder))
 		assert_equal 'Set Created!', flash[:success]

	end

	test "should not create question" do
		assert_difference('Question.count',0) do
	  	post :create, question: {}
		end
	 	assert_template 'new'
	end
end
