class HoldersController < ApplicationController
	def index
		@holder = Holder.new
		@holders = Holder.find_all_by_user_id(current_user.id)
	end

	def new
		@holder = Holder.new
	end

	def create
		@holder = Holder.new(params[:holder])
		@holder.user_id = current_user.id
		if @holder.save
      respond_to do |format|
        format.html { redirect_to holders_path, flash: {success: "Set Created!"} }
        format.js
      end
		else
			render 'new'
		end
	end

	def edit
		@holder = Holder.find(params[:id])
	end

	def update
		@holder = Holder.find(params[:id])
    if @holder.update_attributes(params[:holder])
  		respond_to do |format|
        format.html { redirect_to holders_path, flash: {success: "Set Updated!"} }
        format.js
      end
		else
      render 'edit'
    end
	end

	def show
    @holder = Holder.find(params[:id])
    current_user = User.find_by_remember_token(cookies[:remember_token])
    if current_user.id != @holder.user_id
      redirect_to holders_path
    end
		@questions = Question.find_all_by_holder_id(@holder)
		@question = Question.new
	end
	
	def destroy
		Holder.find(params[:id]).destroy
  	flash[:success] = "Set destroyed."
  	redirect_to holders_path
	end
end
