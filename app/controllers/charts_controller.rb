class ChartsController < ApplicationController
	def show		
	end

	def run
		promos = params[:promoact_id] if  params[:promoact_id].present?
		fbs = params[:feedback_id] if params[:feedback_id].present?
		brands = params[:brand_id] if params[:brand_id].present? 
		prodcats = params[:prodcat_id] if params[:prodcat_id].present?		
		
		@chart_data = []
		if  !fbs.nil? && ( !brands.nil? || !prodcats.nil? || !promos.nil?)
			fbs.each do |f|
				@chart_names = []
				data_ha = {}
				data_arr = []
				if  !prodcats.nil?
					prodcats.each do |pc|
						data_arr.push(Chart.where("prodcat_id = ?", pc).sum(fb_symb(f)))
						@chart_names.push(Prodcat.find_by(id: pc).name)
					end
				else
					if  !brands.nil?
						brands.each do |b|
							data_arr.push(Chart.where("brand_id = ?", b).sum(fb_symb(f)))
							@chart_names.push(Brand.find_by(id: b).name)
						end
					else
						promos.each do |p|
							data_arr.push(Chart.promoact_chart(p, f))
							@chart_names.push(Promoact.find_by(id: p).name)														
						end
					end
				end

				data_ha[:name] = Feedback.find_by(id: f).name
				data_ha[:data] = data_arr
				@chart_data.push(data_ha)
			end		
		
			gon.chart_data = @chart_data
			gon.chart_names = @chart_names

			redirect_to analytics_url
		else
			flash.now[:error] = "Input error. Choose at least one feedback attribute and at least one prodcat or brand or promo."
			render 'show'
		end		

	end	
end
