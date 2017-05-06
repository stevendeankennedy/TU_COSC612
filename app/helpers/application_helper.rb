module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "WeLuv2Travel.net"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
  
  def home_link()
    if current_user.usertype == 1
      @path = travel_packages_url
    elsif current_user.usertype == 2
      @path = users_url
    else
      @path = root_url
    end
  end
  
  def message_count()
    @msg_count = Message.where(recipient: current_user[:email]).count
  end
  
  def get_friends()
    @friends = Friend.find_friends(current_user.id)
  end
end
