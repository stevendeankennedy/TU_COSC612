class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:destroy]
  
  def index
    #@users = User.all # All users
    if (current_user.usertype == 2)
      @users = User.where('usertype != ?', 2)
    else
      @users = User.where('active = ? and private = ? and usertype != ?', true, false, 2) # get users
      # @users = User.all
    end
    @heading = "All users"
  end

  # show the user, will generate the appropriate buttons
  def show
    @user = User.find(params[:id])
    @purchases = PurchaseHistory.where("traveller_id = ?", @user)
    @friend = Friend.where("user = ? and friend = ?", current_user.id, @user.id).count
    @is_friend = false
    if @friend > 0
      @is_friend = true
    end
  end
  
  def new
    @user = User.new # doesn't do anything right now
  end
  
  def create
    @user = User.new(user_params)
    @user.active = true
    @user.private = false
    if @user.save
      # Handle a successful save
      log_in @user
      flash[:success] = "Welcome to WeLuv2Travel.net!"
      redirect_to user_url(@user)
    else
      render 'new'
    end
  end
  
  # Add a friend here.
  def addfriend
    @user = User.find(params[:friend])
    @friend_item = Friend.new( {
      confirmed: false,
      user: current_user.id,
      friend: @user.id,
      friend_name: @user.name,
      friend_email: @user.email
    })
  
    if @friend_item.save
      flash[:success] = "Following."
      redirect_to user_url(params[:friend])
    else
      flash[:danger] = "Sorry, that didn't save..."
      redirect_to root_url
    end
  end
  
  # Remove that friend
  def removefriend
    @friend_item = Friend.find_two_friends(current_user.id, params[:friend]).first
    
    @friend_item.destroy
    flash[:success] = "Unfollowed this user."
    redirect_to user_url(params[:friend])
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

  # Doesn't actually destroy, just make inactive  
  def destroy
    # User.find(params[:id]).destroy
    # flash[:success] = "User deleted"
    # redirect_to users_url
    @user = User.find(params[:id])
    @user.active = false
    if (@user.save)
      flash[:success] = 'User successfully deactivated.'
    else
      flash[:danger] = 'Something went wrong.  Unable to delete.'
    end
    redirect_to users_url
  end
  
  private # --------------------------------------------------------------------
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :usertype, :active, :private)
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
