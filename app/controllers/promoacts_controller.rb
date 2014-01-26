class PromoactsController < ApplicationController
  before_action :signed_in_user   
	
	def index
	end

	def show
	end

	def new
		@promoact = current_user.promoacts.build
	end

	def create
		@promoact = current_user.promoacts.build(promoact_params)
		
		if @promoact.save
			params[:cities][:id].each do |city|
				if !city.empty?
					@promoact.promocities.create(city_id: city) 
				end
			end
			params[:categories][:id].each do |cat|
				if !cat.empty?
					@promoact.promocats.create!(category_id: cat)
				end
			end			
			params[:segments][:id].each do |seg|
				if !seg.empty?
					@promoact.promosegments.create!(segment_id: seg)
				end
			end			
			redirect_to promoacts_url				
		else
			render 'new' 
		end		
	end

	def edit
	end

	def destroy
	end

	private
		def promoact_params
  			params.require(:promoact).permit(:name, :brand_id, :start_date, :finish_date, :del_num, :reward_1, :reward_2, :contact_limit, :budget_limit)
  		end

  		def signed_in_user
  			redirect_to signin_url   unless signed_in?
  			  			
  		end
end

