class FriendsController < ApplicationController
  def create
    @user = User.find_by(id: params[:user_id])
    @friend = @user.friends.new(friend_params)
    if @friend.save
      redirect_to users_path
    else
      redirect_to users_path
    end
  end

  private
  def friend_params
    params.permit(:user1_id)   
  end
end
