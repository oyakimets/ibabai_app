class Api::V1::RegistrationsController < Devise::RegistrationsController
	before_action :configure_permitted_parameters
	before_action :authenticate_customer!, only: :update
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

	def update
		account_update_params = devise_parameter_sanitizer.sanitize(:account_update)
		if account_update_params[:password].blank?
			account_update_params.delete("password")
			account_update_params.delete("password_confirmation")
		end 		
		customer = Customer.find(current_customer.id)
		if customer.update_attributes(account_update_params)
			sign_in customer, bypass: true
			render status: 200, json: { success: true, info: "updated", data: { customer: { age: current_customer.age, gender: current_customer.gender, phone: current_customer.phone, email: current_customer.email}, auth_token: current_customer.authentication_token} }

		else
			render status: 401, json: { success: false, info: "update failed", data: {}}
		end
	end

	protected

		def configure_permitted_parameters
			devise_parameter_sanitizer.for(:sign_up) do |u|
				u.permit(:gender, :age, :phone, :email, :password, :password_confirmation) 
			end
			devise_parameter_sanitizer.for(:account_update) do |u|
				u.permit(:email, :phone, :age, :gender, :password, :password_confirmation)
			end
		end		
	
end
