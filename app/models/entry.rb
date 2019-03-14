class Entry < ApplicationRecord
	belongs_to :account
	after_create :update_account_balance

	private

	def update_account_balance
		if account.entries.count > 1
			new_balance = account.balance + amount
		else
			new_balance = amount
		end

		account.update_attribute(:balance, new_balance)
	end
end
