class UsersController < ApplicationController
  def show
  end

  private
    #ストロングパラメーター
    def user_params
      params.require(:user).permit(:icon, :name, :email, :encrypted_password )
    end
end