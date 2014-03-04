class Api::V1::CessionsController < Devise::SessionsController
	skip_before_action :verify_authenticity_token, if: :json_request?
	respond_to :json

	def create
		warden.authenticate!(scope: resource_name, recall: "#{controller_path}#failure")
		render status: 200, json: { success: true, info: "logged in", data: { auth_token: current_customer.authentication_token} }					
	end

	def destroy
		warden.authenticate!(scope: resource_name, recall: "#{controller_path}#failure")
		current_customer.update_column(:authentication_token, nil)
		render status: 200, json: { success: true, info: "logged out", data: {}}							
	end

	def failure
		render status: 401, json: { success: false, info: "login failed", data: {}}
	end		
	
end