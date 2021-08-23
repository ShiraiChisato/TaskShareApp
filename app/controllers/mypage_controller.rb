class MypageController < ApplicationController
  def show
    @user = User.all
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
    #セーブできたか判定
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

  private
  def user_params
    params.require(:user).permit(:name, :email, :age, :field, :grade, :num)
  end
end
