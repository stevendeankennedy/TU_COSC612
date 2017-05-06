class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the landing page
      log_in user
      # remember them if they request
      if params[:session][:remember_me] == '1'
        remember(user)
      else
        forget(user)
      end
      
      if user.usertype == 1 # Travel Agent
        redirect_to travel_packages_url
      elsif user.usertype == 2 # Admin
        redirect_to users_url
      else
        msgs = Message.where(recipient: user[:email]).count

        if (msgs > 0)
          flash[:info] = "You have messages!"
          redirect_to messages_url
        else
          redirect_back_or user
        end
      end
      
    else # Error
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  # end session
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
