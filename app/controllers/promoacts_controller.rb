class PromoactsController < ApplicationController
  
  before_action :signed_in_user   
  	def index
  		@current_promo_items = current_user.current_promo_list
  		@past_promo_items = current_user.past_promo_list
	end

	def show
		@promoact = Promoact.find(params[:id])
		@brand_name = Brand.find_by(id: @promoact.brand_id).name
		@promo_segments = @promoact.segments_feed
		@promo_cities = @promoact.cities_feed
		@promo_cats = @promoact.cats_feed
		@promo_prods = @promoact.prod_feed
		@promo_brands = @promoact.brand_feed
		@promo_proms = @promoact.promo_feed
		@promo_fbs = @promoact.fb_feed
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

			redirect_to edit_promoact_url(@promoact)				
		else
			render 'new' 
		end		
	end

	def edit
		@promoact = Promoact.find(params[:id])
		@brand_name = Brand.find_by(id: @promoact.brand_id).name
		@promo_segments = @promoact.segments_feed
		@promo_cities = @promoact.cities_feed
		@promo_cats = @promoact.cats_feed
		@promo_prods = @promoact.prod_feed
		@promo_brands = @promoact.brand_feed
		@promo_proms = @promoact.promo_feed
		@promo_fbs = @promoact.fb_feed
	end

	def update
		@promoact = Promoact.find(params[:id])
		if @promoact.update_attributes(promoact_params)
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
			@promo_cities = []
			@promo_segments = []
			@promo_cats = []
			@promo_prods = []
			@promo_brands = []
			@promo_proms = []
			@promo_fbs = []
			render 'edit'
		end				
	end

	def recall
		@promoact = Promoact.find(params[:id])
		if @promoact.status == 5
			@promoact.update_attributes(status: 6, finish_date: Date.today)			
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

	def del_cont_tag
		@promoact = Promoact.find(params[:id])
		@promoact.remove_cont_tag = true
		@promoact.save!
		redirect_to edit_promoact_url(@promoact)
	end

	def del_cont_pres
		@promoact = Promoact.find(params[:id])
		@promoact.remove_cont_pres = true
		@promoact.save!
		redirect_to edit_promoact_url(@promoact)
	end

	def del_cont_desc
		@promoact = Promoact.find(params[:id])
		@promoact.remove_cont_desc = true
		@promoact.save!
		redirect_to edit_promoact_url(@promoact)
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

