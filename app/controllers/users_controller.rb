class UsersController < ApplicationController
  def index
    ＠users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to root_path, success: "ユーザーを作成しました"
    else
      flash.now[:danger] = "ユーザーの作成に失敗しました"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end