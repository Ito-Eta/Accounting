class Account < ApplicationRecord
	belongs_to :user
	has_many :entries, dependent: :destroy
	after_create :create_entry

	private
	def create_entry
		entry_hash = {date: Date.today, description: "Opening Balance", amount: balance}

		entries.create(entry_hash)
	end
end
