module SessionsHelper
    
    # Logs in the given user
    def log_in(user)
        session[:user_id] = user.id
    end
    
    # Gets the current logged-in user (assuming there is one)
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
    # Returns true if logged in, or false if not logged in
    def logged_in?
        !current_user.nil?
    end
    
    # Log out
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
