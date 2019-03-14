class EntriesController < ApplicationController
	before_action :require_login
	before_action :require_account

	def index
		@entries = @account.entries
		@entries = @entries.order(date: :desc)
	end

	def new

	end

	def create
		@entry = @account.entries.build(entries_params)

		if @entry.save
			redirect_to user_account_entries_path(@user, @account)
		else
			render 'new'
		end
	end

	def destroy
		@entry = Entry.find(params[:id])
		@entry = @entry.attributes

		@entry['description'] = "(UNDO) #{@entry['description']}"
		@entry['amount'] = @entry['amount'] * -1
		@entry['date'] = Date.today

		if Entry.create(date: @entry['date'], description: @entry['description'], amount: @entry['amount'], account_id: @entry['account_id'])
			redirect_to user_account_entries_path(@user, @account)
		else
			render 'new'
		end
	end

	private
	def require_login
  		if session[:user_id]
			@user = User.find(session[:user_id])
  		else
  			redirect_to '/welcome/index'
  		end
  	end

  	def entries_params
  		@new_entry = params.require(:entry).permit(:date, :description, :amount, :entry_type)
  		if @new_entry[:entry_type] == "Withdrawal"
  			@new_entry[:amount] = dollars_to_cents(@new_entry[:amount].to_f) * -1
  		else
  			@new_entry[:amount] = dollars_to_cents(@new_entry[:amount].to_f)
  		end

  		@new_entry = @new_entry.except(:entry_type)
  	end

  	def require_account
  		@account = Account.find(params[:account_id])
  	end
end
