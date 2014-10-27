class Api::V1::ValidationsController < ApplicationController	
	
	skip_before_action :verify_authenticity_token, if: :json_request?	
	before_action :authenticate_customer!		
	respond_to :json, :xml

	def validate_customer		
		
		if current_customer.valid_password?(params["credentials"]["password"])
			render status: 200, json: { success: true, info: "validated" }
		else 
			render status: :unprocessable_entity, json: { success: false, info: "Invalid password. Try again!" } 
		end		
	end	
end
