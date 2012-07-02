class QuestionsController < ApplicationController

	def index
		@questions = Question.all
	end

	def show
  	@question = Question.find(params[:id])
	end

	def new
		@question = Question.new
		@holder_id = params[:holder_id]
	end

	def create
		@question = Question.new(params[:question])
		if @question.save
			flash[:success] = "Question Saved"
      redirect_to @question
		else
			render 'new'
		end
	end
end
