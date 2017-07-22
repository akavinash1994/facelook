class PostsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)
    if @post.save
      flash[:success] = "The post added!"
      redirect_to users_path
    else
      redirect_to users_path
    end
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end
