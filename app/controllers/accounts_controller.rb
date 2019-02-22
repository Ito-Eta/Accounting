class AccountsController < ApplicationController
  def index
  	@current_user = User.find(session[:user_id])
  	@accounts = @current_user.accounts
  end

  def new
  end

  def create
  	@user = User.find(session[:user_id])
  	@account = @user.accounts.create(account_params)

  	
  	if @account.save
  		redirect to '/accounts'
  	else
  		render 'new'
  	end
  end

  private
  def account_params
  	params.require(:account).permit(:name, :balance, :account_type)
  end
end
