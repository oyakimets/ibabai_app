class Api::V1::CustomersController < ApplicationController
	skip_before_action :verify_authenticity_token, if: :json_request?	
	before_action :authenticate_customer!		
	respond_to :json
		
	def update_password
		customer = Customer.find(current_customer.id)
		if customer.reset_password!(params["customer"]["password"], params["customer"]["password_confirmation"])
			sign_in customer, bypass: true
			render status: 200, json: { success: true, info: "password set", data: { auth_token: current_customer.authentication_token} }
		else
			render status: 401, json: { success: false, info: "password failed", data: {}}
		end
	end

	private
		def user_params
  			params.require(:customer).permit(:email, :phone, :gender, :age, :password, :password_confirmation)
  		end	
end
