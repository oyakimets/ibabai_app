class Api::V1::CustLogsController < ApplicationController
	skip_before_action :verify_authenticity_token, if: :json_request?	
	#before_action :authenticate_customer!		
	respond_to :json

	def create
		respond_with CustLog.create(cust_log_params), location: nil			
	end	
	
	private

		def cust_log_params
			params.require(:cust_log).permit(:promoact_id, :customer_id, :store_id, :segment_id, :category_id, :fc_1, :fc_2, :fc_3)  	
		end
end