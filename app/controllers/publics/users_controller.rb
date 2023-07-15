class Publics::UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]
before_action :check_owner, only: [:edit, :update, :destroy]

  def index
    if params[:keyword].present?
    @users = User.where("nickname LIKE ?", "%#{params[:keyword]}%")
    else
    @users = User.all
    end
  end


  def show
  end

  def update
    if @user.update!(user_params)
      redirect_to publics_user_path(@user), notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: 'User was successfully deleted.'
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_katakana, :first_name_katakana, :nickname, :post_code, :address, :phone_number, :profile, :email, :profile_image)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def check_owner
    unless @user == current_user
      redirect_to root_path, alert: "You don't have permission to perform this action."
    end
  end

end