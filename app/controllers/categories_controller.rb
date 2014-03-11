class CategoriesController < ApplicationController
	before_action :correct_user, only: [:update, :destroy]

	def new
		@category = current_user.categories.build		
		@cat_list_items = current_user.cat_list		
	end
	
	def create
		@category = current_user.categories.build(category_params)
		
		if @category.save
			params[:formatts][:id].each do |formatt|
				if !formatt.empty?
					@category.catforms.create(formatt_id: formatt) 
				end
			end

			params[:chains][:id].each do |chain|
				if !chain.empty?
					@category.catchains.create(chain_id: chain) 
				end
			end
			@category.log_cat_count					
			redirect_to new_category_url				
		else
			@cat_list_items = []
			render 'new' 
		end		
	end

	def update
     	@category.update_column(:dropped, true)
      	redirect_to new_category_url
  	end

	private

		def category_params 
			params.require(:category).permit(:name)
		end

				
		def correct_user
        	@category = current_user.categories.find_by(id: params[:id])
        	redirect_to user_url(current_user) if @category.nil?
    	 end     
end

