class LikesController < ApplicationController
  def create
     return destroy unless !liked?
     params[:post_id].present? ? (@post = Post.find(params[:post_id])): (@profile_picture = ProfilePicture.find(params[:profile_picture_id]))
      if @post && @post.likes.create(user_id: params[:user_id])
        redirect_to users_path
      elsif @profile_picture && @profile_picture.likes.create(params)
        redirect_to user_path(current_user)
      end     
  end

  def destroy
    Like.find_by(likeable_type: 'Post', user_id: current_user.id).destroy
    redirect_to users_path
  end

  private
  def liked?
    Like.find_by(likeable_type: 'Post', user_id: current_user.id).present?
  end
end
