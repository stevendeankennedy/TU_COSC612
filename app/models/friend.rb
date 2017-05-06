class Friend < ApplicationRecord

  def Friend.find_friends(user)
    where("user = ?", user)
  end
  
end
