require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
	test "should get index" do
	 	get :index
	  assert_response :success
	  assert_not_nil assigns(:questions)
	end

	test "should get new" do
		get :new
		assert_response :success
		assert_not_nil assigns(:question)
	end

	test "should create question" do
		assert_difference('Question.count') do
    	post :create, question: { question: 'apple', answer: "good", holder_id: 2}
  	end
	end

	test "should not create question" do
		invalid_answer = "a" * 145 

		assert_difference('Question.count',0) do
	  	post :create, question: { answer: invalid_answer }
		end

	 	assert_template 'new'
	end
end