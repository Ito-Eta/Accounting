class User < ApplicationRecord
	has_many :accounts

	def authenticate(password)
		password == encrypted_password
	end
end
