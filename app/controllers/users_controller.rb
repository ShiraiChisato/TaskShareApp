class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end
  private
    #ストロングパラメーター
    def user_params
      params.require(:user).permit(:icon, :name, :email, :encrypted_password )
    end
end