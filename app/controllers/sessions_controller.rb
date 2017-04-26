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
      redirect_to user
      
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
