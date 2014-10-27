class Api::V1::DebitsController < ApplicationController	
	
	skip_before_action :verify_authenticity_token, if: :json_request?	
	before_action :authenticate_customer!		
	respond_to :json, :xml

	def validate_po		
		
		if current_customer.valid_password?(params["credentials"]["password"])
			if params["credentials"]["amount"].to_i <= current_customer.balance
				render status: 200, json: { success: true, info: "validated" }
			else
				render status: :unprocessable_entity, json: { success: false, info: "Payment order error. Contact us!" } 
			end
		else 
			render status: :unprocessable_entity, json: { success: false, info: "Invalid password. Try again!" } 
		end		
	end	
end
