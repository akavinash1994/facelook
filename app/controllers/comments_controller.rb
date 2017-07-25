class CommentsController < ApplicationController
  before_action :get_post
  before_action :get_profile_picture

  def create
    return render json: { view: render_partial_form } if @post && @post.comments.create(comment_params)
    return render json: { view: render_partial_form } if @profile_picture && @profile_picture.comments.create(comment_params)
  end

  private
  def destroy
    @post.comments.where(user_id: current_user.id).first.destroy if @post 
    @profile_picture.comments.where(user_id: current_user.id).first.destroy if @profile_picture
    render json: { count: get_likes }
  end
  
  def get_post
    @post = Post.find_by(id: params[:post_id]) if params[:post_id].present?
  end

  def get_profile_picture
    @profile_picture = ProfilePicture.find_by(id: params[:profile_picture_id]) if params[:profile_picture_id].present?
  end

  def comment_params
    params.permit(:user_id, :content)   
  end

  def render_partial_form
    render_to_string(partial: 'users/post', :locals => { :post => @post })
  end
end
