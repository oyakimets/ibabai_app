class Api::V1::CustLogsController < ApplicationController
	skip_before_action :verify_authenticity_token, if: :json_request?	
	before_action :authenticate_customer!		
	respond_to :json, :xml

	def create
		cust_log = current_customer.cust_logs.build(cust_log_params)
		if cust_log.save			
			render status: 200, json: { success: true, info: "registered", data:{balance: Customer.find_by(id: cust_log.customer_id).balance} }
		else 
			render status: :unprocessable_entity, json: { success: false, info: "registration failed" }
		end		
	end	
	
	private

		def cust_log_params
			params.require(:cust_log).permit(:promoact_id, :customer_id, :store_id, :segment_id, :category_id, :fc_1, :fc_2, :fc_3)  	
		end
end