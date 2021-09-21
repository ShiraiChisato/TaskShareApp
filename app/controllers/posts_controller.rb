class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit

  end

  def create
    @post =  current_user.post.new(posts_params)
    @project = @post.project
    if current_user.save
      redirect_to project_show
    else
      error_mes = ""
      @post.errors.full_messages.each do |error|
        error_mes += "!#{error}<br>"
      end
      flash[:alert] = error_mes.html_safe
      redirect_to post_new
    end
  end

  def destroy

  end

  def update

  end

  private
    def posts_params
      params.require(:project).permit(:user, :project, :topic1, :topic2, :topic3, :topic4, :topic5)
    end
end
