class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    if user_signed_in?
      @user = User.find(params[:id])
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # update メソッドが正しく実行できたとき詳細ページに戻る
      redirect_to @user
      flash[:notice] = "正常にアップデートされました"
    else
      # updateできなかったときにエラーを表示
      flash[:alert] = "エラー：#{@user.errors.full_messages}"
      # renderで入力した内容はそのままで変種ページに戻る
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      error_mes = ""
      @user.errors.full_messages.each do |error|
        error_mes += "!#{error}<br>"
      end
      flash[:alert] = error_mes.html_safe
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.delete
      flash[:notice] = "正常に削除されました"
      redirect_to users_path
    else
      flash[:alert] = "削除できませんでした"
      render :show
    end
  end

  protected
    def after_sign_up_path_for(resource)
      after_sign_in_path_for(resource)
  end

  protected
    def after_sign_in_path_for(resource)
      "mypage/show"
    end
  private
    def user_params
      params.require(:user).permit(:icon, :name, :email, :encrypted_password )
  end
end