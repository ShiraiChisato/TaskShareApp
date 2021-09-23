class ProjectsController < ApplicationController
  def search
    if params[:post].present?
      @users = User.where('プロジェクトのIDを教えてください', "%#{params[:post]}%")
    else
      @users = User.none
    end
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
    @host_member = @project.users.where(associates: {host: true})
    @not_host_member = @project.users.where(associates: {host: false})
    @posts = @project.posts.page(params[:page]).per(10)
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project =  current_user.projects.new(projects_params)
    #確認
    if current_user.save
      set_host
      redirect_to @project
    else
      error_mes = ""
      @project.errors.full_messages.each do |error|
        error_mes += "!#{error}<br>"
      end
      flash[:alert] = error_mes.html_safe
      redirect_to 'new'
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(projects_params)
      # update メソッドが正しく実行できたとき詳細ページに戻る
      redirect_to @project
      flash[:notice] = "正常にアップデートされました"
    else
      # updateできなかったときにエラーを表示
      flash[:alert] = "エラー：#{@project.errors.full_messages}"
      # renderで入力した内容はそのままで変種ページに戻る
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.delete
      flash[:notice] = "正常に削除されました"
      redirect_to users_path
    else
      flash[:alert] = "削除できませんでした"
      render :show
    end
  end

  private
    def projects_params
      params.require(:project).permit(:name, :icon, :note, :topic1, :topic2, :topic3, :topic4, :topic5, :remove_icon)
    end
    def set_host
      Associate.where(user: current_user, project: @project).update(host: true)
    end
end
