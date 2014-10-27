class Api::V1::TransactionsController < ApplicationController
	skip_before_action :verify_authenticity_token, if: :json_request?	
	before_action :authenticate_customer!		
	respond_to :json, :xml

	def create
		transaction = current_customer.transactions.build(transaction_params)
		if transaction.save
			balance = transaction.customer.balance			
			if transaction.dc_flag == "C"
				transaction.credit_balance				
			else
				transaction.debit_balance				
			end
			render status: 200, json: { success: true, info: "Payment order excepted", data: {balance: transaction.customer.balance}}			
		else 
			render status: :unprocessable_entity, json: { success: false, info: "Payment order failed", data:{}}			
		end
	end	
	
	private

		def transaction_params
			params.require(:transaction).permit(:customer_id, :agent_id, :agent_name, :amount, :dc_flag)  	
		end
end