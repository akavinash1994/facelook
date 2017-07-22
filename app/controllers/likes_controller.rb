class LikesController < ApplicationController
  before_action :get_post
  before_action :get_profile_picture

  def create
    return destroy unless !liked?
    return render json: { count: get_likes } if @post && @post.likes.create(user_id: params[:user_id])    
    return render json: { count: get_likes } if @profile_picture && @profile_picture.likes.create(user_id: params[:user_id]) 
  end
  
  private
  def destroy
    @post.likes.where(user_id: current_user.id).first.destroy if @post 
    @profile_picture.likes.where(user_id: current_user.id).first.destroy if @profile_picture
    render json: { count: get_likes }
  end

  def liked?
    return @post.likes.where(user_id: current_user.id).present?  if @post 
    @profile_picture && @profile_picture.likes.where(user_id: current_user.id).present?
  end

   def get_likes
    return @post.likes.count if @post.present?
    return @profile_picture.likes.count if @profile_picture.present?
  end
  
  def get_post
    @post = Post.find_by(id: params[:post_id]) if params[:post_id].present?
  end

  def get_profile_picture
    @profile_picture = ProfilePicture.find_by(id: params[:profile_picture_id]) if params[:profile_picture_id].present?
  end
end