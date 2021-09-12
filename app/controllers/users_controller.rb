class UsersController < ApplicationController
  def show

  end

  def new
    @user = User.new

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :show
    end
  end

  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    if @user.save
        redirect_to users_path
    else
        render :new
    end
  end

  protected
    def after_sign_up_path_for(resource)
      '/mypage/show'
  end

  private
    #ストロングパラメーター
    def user_params
      params.require(:user).permit(:icon, :name, :email, :encrypted_password )
  end
end