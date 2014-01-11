class BrandsController < ApplicationController
  before_action :correct_user, only: [:update, :destroy]
	def create
  		@brand = current_user.brands.build(brand_params)
  		if @brand.save
  			flash.now[:success] = "Brand added!"
  			redirect_to user_url(current_user)
  		else
      	@list_items = []
      	render "users/show"
  		end
  	end

    def destroy
      @brand.destroy
      redirect_to user_url(current_user)
    end

  	def update
      @brand.update_column(:dropped, true)
      redirect_to user_url(current_user)
  	end

  	private

  		def brand_params
  			params.require(:brand).permit(:name, :dropped)
  		end

      def correct_user
        @brand = current_user.brands.find_by(id: params[:id])
        redirect_to user_url(current_user) if @brand.nil?
      end

end