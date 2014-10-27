class Api::V1::StoplistsController < ApplicationController
	skip_before_action :verify_authenticity_token, if: :json_request?	
	before_action :authenticate_customer!		
	respond_to :json, :xml

	def block
		stoplist = Stoplist.new(customer_id: current_customer.id, client_id: sl_params["client_id"])
		if stoplist.save
			render status: 200, json: { success: true, info: "Client blocked" }
		else 
			render status: :unprocessable_entity, json: { success: false, info: "Block failed" }
		end
	end

	def unblock
		stoplist = Stoplist.where("customer_id = ? AND client_id = ?", current_customer.id, sl_params["client_id"]).first
		stoplist.destroy
		render status: 200, json: { success: true, info: "Client unblocked" } 
	end

	private
		def sl_params
			params.require(:stoplist).permit(:client_id)  	
		end
end	