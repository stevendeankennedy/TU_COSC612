class FriendsController < ApplicationController
  
  def index
    # @users = User.paginate(page: params[:page], per_page: 20) # get paginated users
    @heading = "Following"
    @friends = Friend.find_friends(current_user.id)
  end
  
end
