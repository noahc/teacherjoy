class HoldersController < ApplicationController
	def index
		@questions = Question.all
	end

	def new
		@holder = Holder.new
	end

	def create
		@holder = Holder.new(params[:holder])
		if @holder.save
			flash[:success] = "Set Created!"
      redirect_to @holder
		else
			render 'new'
		end
	end

end
