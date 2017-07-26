class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :show]
  before_action :correct_user,   only: [:edit, :update]
  
  def index
    @users =User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.set_confirmation_token
      if @user.save
        UserMailer.registration_confirmation(@user).deliver_later
        flash[:success] = "Please confirm your email address to continue"
        redirect_to root_url
      end
    else
      render 'new'
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def search
    return render json: { result: search_result}
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:token])
    if user
      user.validate_email
      if user.save(validate: false) 
        redirect_to new_session_path
      end
    else
     flash[:error] = "Sorry. User does not exist"
     redirect_to root_url
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :gender, :date_of_birth, :phone_number, :house_number, :city, :state, :country)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to root_url
    end
  end

  def correct_user
    @user = User.find_by(id: params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def search_result
    return [first_name: "no result matches"] if !params[:first_name].present? || !User.where("first_name LIKE '%#{params[:first_name]}%'").present?
    User.where("first_name LIKE '%#{params[:first_name]}%'")
  end
end
