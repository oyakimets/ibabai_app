class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  before_action :adm_user, only: [:new, :create, :index]

  def index
    @user_items = user_account.user_list    
  end
        
  def show  	
  	@user = User.find(params[:id])
    @brand = current_user.brands.build
  	@list_items = current_user.list   
  end
  
  def new
  	@user = User.new  	
  end

  def create
    @user = user_account.users.build(user_params)    
  	if @user.save
      #@user.send_password_reset    
      flash[:success] = "The new user was created."
      redirect_to root_url
  	else
      render 'new'
  	end
  end

  def edit    
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated!"
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  def cust_seg
    @segment = current_user.segments.build
    @seg_list_items = current_user.seg_list
  end
  
  private 

  	def user_params
  		params.require(:user).permit(:name, :email, :tel1, :tel2, :client_id, :password, :password_confirmation, :admin)
  	end
    
    def adm_user
      redirect_to(signout_url) unless current_user.admin?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(signout_url) unless current_user?(@user)
    end       
end
