class Api::V1::RegistrationsController < Devise::RegistrationsController
	before_action :configure_permitted_parameters
	skip_before_action :verify_authenticity_token, if: :json_request?
	respond_to :json

	def create
		build_resource(sign_up_params)
		if resource.save
			customer_sign_in resource
			render status: 200, json: { success: true, info: "registered", data: { customer: resource, auth_token: current_customer.authentication_token } }
		else
			render status: :unprocessable_entity, json: { success: false, info: resource.errors, data: {} }
		end

	end

		protected

			def configure_permitted_parameters
				devise_parameter_sanitizer.for(:sign_up) do |u|
					u.permit(:gender, :age, :phone, :email, :password, :password_confirmation) 
				end
			end		
	
end
