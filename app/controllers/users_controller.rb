class UsersController < ApplicationController
  
  def show
  	@user = User.find(params[:id])
  end

  def new
  end

  def create
  	@user = User.new(user_params)

  	@user.save
  	redirect_to @user
  end


  private
	def user_params
		params.require(:users).permit(:first_name, :last_name, :email, :encrypted_password)
	end
end
