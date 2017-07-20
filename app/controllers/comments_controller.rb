class CommentsController < ApplicationController
  before_action :get_post
  before_action :get_profile_picture

  def create
    # return render json: {count: get_likes} if @post && @post.comments.create(user_id: params[:user_id])    
    # return render json: {count: get_likes} if @profile_picture && @profile_picture.comments.create(user_id: params[:user_id]) 
    byebug
    if @post && @post.comments.create(comment_params)
      byebug
      redirect_to users_path
    end
  end


  private
  
  def destroy
    @post.comments.where(user_id: current_user.id).first.destroy if @post 
    @profile_picture.comments.where(user_id: current_user.id).first.destroy if @profile_picture
    render json: {count: get_likes}
  end
  
  def get_post
    @post = Post.find(params[:post_id]) if params[:post_id].present?
  end

  def get_profile_picture
    @profile_picture = ProfilePicture.find(params[:profile_picture_id]) if params[:profile_picture_id].present?
  end  

  def comment_params
    byebug
    params[:comment].merge!(user_id: params[:user_id])
    params.require(:comment).permit(:content, :user_id)
    #params[:comment].merge(user_id: params[:user_id])
  end
end
