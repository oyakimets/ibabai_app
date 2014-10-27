class Transaction < ActiveRecord::Base
	belongs_to :customer	

	def credit_balance
		current_balance = self.customer.balance
		self.customer.update_column(:balance, current_balance+self.amount)
	end
	def debit_balance
		current_balance = self.customer.balance
		self.customer.update_column(:balance, current_balance-self.amount)
	end

end
