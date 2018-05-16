class UsersController < ApplicationController
  def index
    @users = User.all.paginate(page: params[:page], per_page: 15)
  end

  def show
    @user = User.find(user_params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(user_params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: I18n.t('controller.messages.update')
    else
      render :new
    end
  end

  def update
    @user = User.find(user_params[:id])
    if @user.update_attributes(user_params)
      redirect_to admin_users_path, notice: I18n.t('controller.messages.update')
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :email, :role)
  end
end
