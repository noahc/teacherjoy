class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def create
  		@user = User.new(params[:user])
		if @user.save
      sign_in(@user)
			flash[:success] = "User Created!"
      redirect_to holders_path
		else
			render 'new'
		end
  end

  def edit
    @user = User.find_by_remember_token(cookies[:remember_token])
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
else
      render 'edit'
    end
end

end
