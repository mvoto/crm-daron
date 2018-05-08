class Admin::UsersController < ApplicationController
  def index
    @users = User.all.paginate(page: params[:page], per_page: 15)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.password = User::DEFAULT_PASSWORD

    if @user.save
      redirect_to admin_users_path, notice: I18n.t('controller.messages.create')
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to admin_users_path, notice: I18n.t('controller.messages.update')
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: I18n.t('controller.messages.destroy')
  end

  private

  def user_params
    params.require(:user).permit(:id, :email, :role)
  end
end
