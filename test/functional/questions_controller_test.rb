require 'test_helper'
require 'pp'

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
    	post :create, question: { question: 'apple'}
  	end

 		assert_redirected_to question_path(assigns(:question))
 		assert_equal 'Question Saved', flash[:success]

	end

	test "should not create question" do
		invalid_answer = "a" * 145 

		assert_difference('Question.count',0) do
	  	post :create, question: { answer: invalid_answer }
		end

	 	assert_template 'new'
	end

	test "should get show" do
		get :show, {id: questions(:prez_one).id}
		assert_response :success
		assert_not_nil assigns(:question)
	end



end