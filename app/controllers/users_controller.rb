class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:destroy]
  
  def index
    #@users = User.all # All users
    @users = User.paginate(page: params[:page], per_page: 20) # get paginated users
  end
  
  def show
    @user = User.find(params[:id])
    @purchases = PurchaseHistory.where("traveller_id = ?", @user)
  end
  
  def new
    @user = User.new # doesn't do anything right now
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      # Handle a successful save
      log_in @user
      flash[:success] = "Welcome to WeLuv2Travel.net!"
      redirect_to user_url(@user)
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      # Success
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  
  private # --------------------------------------------------------------------
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :usertype)
    end
    
    # before filters
    # confirm logged-in user
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
    # confirm correct user
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless (current_user?(@user) || current_user.usertype == 2)
    end
    
    # confirms admin
    def admin_user
      redirect_to(root_url) unless current_user.usertype == 2
    end
end
