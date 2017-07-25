class FriendsController < ApplicationController
  before_action :get_second_user
  
  def create
    @user = User.find_by(id: params[:user_id])
    @friend = @user.friends.new(friend_params)
    if @friend.save
      return render json: { view: render_partial }
    else
      redirect_to users_path
    end
  end

  private
  def friend_params
    params.permit(:user1_id)
  end

  def get_second_user
    @user2 = User.find_by(id: params[:user1_id])
  end

  def render_partial
    render_to_string(:partial => 'users/friend', :locals => { :user => @user2 })
  end
end
