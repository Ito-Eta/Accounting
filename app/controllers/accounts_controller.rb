class AccountsController < ApplicationController
  before_action :require_login

  def index
  	@accounts = @user.accounts

  end

  def new
 
  end

  def create
  	@account = @user.accounts.build(account_params)
    @account.balance = dollars_to_cents(@account.balance)

  	
  	if @account.save
  		redirect_to '/accounts'
  	else
  		render 'new'
  	end
  end

  def destroy
  	@account = Account.find(params[:id])
  	@account.destroy

  	redirect_to '/accounts'
  end

  private
  def account_params
    @info = params.require(:account).permit(:name, :balance, :account_type)
  end

  def require_login
  	if session[:user_id]
		@user = User.find(session[:user_id])
  	else
  		redirect_to '/welcome/index'
  	end
  end
end
