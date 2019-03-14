class ApplicationController < ActionController::Base
	helper_method :dollars_to_cents
	helper_method :cents_to_dollars

	def dollars_to_cents(dollars)
		dollars * 100
	end

	def cents_to_dollars(cents)
		cents / 100
	end
end
