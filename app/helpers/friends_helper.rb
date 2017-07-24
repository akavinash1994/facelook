module FriendsHelper
  def friend_request_status(user)
    return 1 if Friend.where(:user_id => current_user.id, :user1_id => user.id).present? && Friend.where(:user_id => user.id, :user1_id => current_user.id).present?
    return 2 if Friend.where(:user_id => current_user.id, :user1_id => user.id).present? #friend request send
    return 3 if Friend.where(:user_id => user.id, :user1_id => current_user.id).present? #friend request recived
    return 0
  end
end
