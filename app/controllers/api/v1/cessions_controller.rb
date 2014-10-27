class Api::V1::CessionsController < Devise::SessionsController
	
	skip_before_action :verify_authenticity_token, if: :json_request?
	respond_to :json

	def create
		customer = = Customer.find_by(email: params["credentials"]["email"])
		customer.clear_at!

		warden.authenticate!(scope: resource_name, recall: "#{controller_path}#failure")
		render status: 200, json: { success: true, info: "logged in", data: { auth_token: current_customer.authentication_token} }					
	end	

	def failure
		render status: 401, json: { success: false, info: "login failed", data: {}}
	end		
	
end