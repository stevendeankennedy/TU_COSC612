class Friend < ApplicationRecord

  def Friend.find_friends(user1, user2)
    where("user = ? and friend = ?", user1, user2)
  end
  
end
