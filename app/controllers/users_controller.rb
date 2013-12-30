class UsersController < ApplicationController
  
  def show  	
  	@user = User.find(params[:id])
  	@client = Client.find_by(id: @user.client_id)
  end
  
  def new
  	@user = User.new
  	
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      sign_in @user
      flash[:success] = "The new user was created."
      redirect_to @user
  	else
  		render 'new'
  	end
  end

  private 

  	def user_params
  		params.require(:user).permit(:name, :email, :tel1, :tel2, :client_id, :password, :password_confirmation)
  	end
end
