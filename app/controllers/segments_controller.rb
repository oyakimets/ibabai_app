class SegmentsController < ApplicationController
	before_action :correct_user, only: [:update, :destroy]
	
	def create
		@segment = current_user.segments.build(segment_params)
		if @segment.save
			redirect_to cust_seg_url
		else
			render 'cust_seg'
		end
	end

	def update
     	@segment.update_column(:dropped, true)
      	redirect_to cust_seg_url
  	end

	private
		def segment_params 
			params.require(:segment).permit(:name, :gender, :age_min, :age_max, :income)
		end

		def correct_user
        	@segment = current_user.segments.find_by(id: params[:id])
        	redirect_to user_url(current_user) if @segment.nil?
    	 end     
end
