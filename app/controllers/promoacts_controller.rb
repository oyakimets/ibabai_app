class PromoactsController < ApplicationController
  
  before_action :signed_in_user   
  	def index
  		@current_promo_items = current_user.current_promo_list
  		@past_promo_items = current_user.past_promo_list
	end

	def show
		@promoact = Promoact.find(params[:id])
	end

	def new
		@promoact = current_user.promoacts.build				
	end

	def create
		@promoact = current_user.promoacts.build(promoact_params)
		@promoact.attributes = { client_id: current_user.client_id }
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

			params[:prodcats][:id].each do |pc|
        		if !pc.empty?
         			@promoact.promoprods.create!(prodcat_id: pc)
        		end
      		end
			
			params[:brands][:id].each do |b|
				if !b.empty?
					@promoact.promobrands.create!(brand_id: b)
				end
			end
			params[:past_promoacts][:id].each do |pp|
				if !pp.empty?
					@promoact.promorelations.create!(past_promoact_id: pp)
				end
			end
			params[:feedbacks][:id].each do |fb|
				if !fb.empty?
					@promoact.promofeedbacks.create!(feedback_id: fb)
				end
			end

			redirect_to promoacts_url				
		else
			render 'new' 
		end		
	end

	def edit
		@promoact = Promoact.find(params[:id])
	end

	def update
		@promoact = Promoact.find(params[:id])
		@promoact.update_attributes(promoact_params)		
		redirect_to promoacts_url		
	end

	def recall
		@promoact = Promoact.find(params[:id])
		if @promoact.status == 5
			@promoact.update_column(:status, 6)
		else
			@promoact.update_column(:status, 1)	
		end	
		redirect_to promoacts_url		
	end

	def drop
		@promoact =	Promoact.find(params[:id])
		if @promoact.status == 6
			@promoact.update_column(:dropped, true)
			redirect_to promoacts_url
		end
	end	
	
	def destroy
		@promoact = Promoact.find(params[:id])
		@promoact.destroy
		redirect_to promoacts_url
	end

	private
		def promoact_params
  			params.require(:promoact).permit(:name, :brand_id, :start_date, :finish_date, :del_num, :reward_1, :reward_2, :contact_limit, :budget_limit, :client_id, :cont_tag, :cont_pres, :cont_desc)
  		end

  		def signed_in_user
  			redirect_to signin_url   unless signed_in?
  			  			
  		end
end

