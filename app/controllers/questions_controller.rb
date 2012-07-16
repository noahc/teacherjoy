class QuestionsController < ApplicationController

	def index
		@questions = Question.all
	end

	def show
  	@question = Question.find(params[:id])
  	@holder = Holder.find_by_id(@question.holder.id)
    current_user = User.find_by_remember_token(cookies[:remember_token])
    if current_user.id != @holder.user_id
      redirect_to holders_path
    end
	end

	def edit
		@question = Question.find(params[:id])
	end

	def update
		@question = Question.find(params[:id])
    if @question.update_attributes(params[:question])
    	redirect_to holder_path(@question.holder_id) 
		else
      render 'edit'
    end
	end

	def new
		@question = Question.new
		@holder_id = params[:holder_id]
	end

	def create
		@question = Question.new(params[:question])
		if @question.save
			flash[:success] = "Question Saved"
      redirect_to holder_path(@question.holder_id)
		else
			render 'new'
		end
	end

	def destroy
  	question = Question.find(params[:id]).destroy
    flash[:success] = "Question destroyed."
    redirect_to holder_path(question.holder_id)
	end
end
