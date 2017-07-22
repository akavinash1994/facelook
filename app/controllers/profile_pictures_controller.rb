class ProfilePicturesController < ApplicationController
  def index
    @profilepicture = ProfilePicture.order('created_at')
  end

  def new
    @profilepicture = ProfilePicture.new
  end

  def create
    @user = User.find(params[:user_id])
    @profilepicture = @user.profile_pictures.create(photo_params)
    flash[:success] = "The photo was added!"
    redirect_to user_path(current_user)
  end
  
  private
  def photo_params
    params.require(:profilepicture).permit(:image)
  end
end
