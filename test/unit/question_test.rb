require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

	test "question must be present" do
  	question = Question.new(question: "question", answer: "ansewer")
  	assert question.valid?
 	end

 	test "question must not be blank" do
 		question = Question.new(question: "    ", answer: "ansewer")
  	assert !question.valid?
 	end

 test "question must not be nil" do
  question = Question.new(question: nil, answer: "ansewer")
  assert !question.valid?
 end

	test "answer must be present" do
  	question = Question.new(question: "question", answer: "answer")
  	assert question.valid?
 	end

 	test "answer must not be blank" do
 		question = Question.new(answer: "    ", question: "question")
  	assert !question.valid?
 	end

 test "answer must not be nil" do
  question = Question.new(question: nil, question: "question")
  assert !question.valid?
 end

	test "Question can't be longer 250 characters" do
		question = "a" * 255
		longer_than_250 = Question.new(question: question)
		assert !longer_than_250.valid?
	end

	test "Answers can't be longer 140 characters" do
		answer = "a" * 145
		longer_than_140 = Question.new(answer: answer)
		assert !longer_than_140.valid?
	end
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

