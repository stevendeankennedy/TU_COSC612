module SessionsHelper
    
    # Logs in the given user
    def log_in(user)
        session[:user_id] = user.id
    end
    
    # Remember user!
    def remember(user)
        user.remember
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end
    
    # Is this user the current user?
    def current_user?(user)
        user == current_user
    end
    
    # Gets the current logged-in user (assuming there is one)
    def current_user
        # @current_user ||= User.find_by(id: session[:user_id]) # old version
        if (user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies.signed[:user_id])
            user = User.find_by(id: user_id)
            if user && user.authenticated?(cookies[:remember_token])
                log_in user
                @current_user = user
            end
        end # end main if
    end
    
    # Returns true if logged in, or false if not logged in
    def logged_in?
        !current_user.nil?
    end
    
    # Forget session
    def forget(user)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end
    
    # Log out
    def log_out
        # forget, then logout
        forget(current_user)
        session.delete(:user_id)
        @current_user = nil
    end
    
    # Redirects to stored location or default
    def redirect_back_or(default)
        redirect_to(session[:forwarding_url] || default)
        session.delete(:forwarding_url)
    end
    
    # stores URL
    def store_location
        session[:forwarding_url] = request.original_url if request.get?
    end
end
