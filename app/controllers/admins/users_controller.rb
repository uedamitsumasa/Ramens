class Admins::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authenticate_admin!

  def index
    @users = User.all
    if params[:keyword].present?
      @users = @users.where('nickname LIKE ?', "%#{params[:keyword]}%")
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admins_user_path(@user), notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admins_users_path, notice: 'このユーザーの情報を削除しました。'
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_katakana, :first_name_katakana, :nickname, :post_code, :address, :phone_number, :profile, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
