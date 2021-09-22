class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @project = Project.find(params[:project_id])
  end

  def edit

  end

  def create
    @post =  current_user.posts.new(posts_params)
    if current_user.save
      redirect_to project_path(@project)
    else
      error_mes = ""
      @post.errors.full_messages.each do |error|
        error_mes += "!#{error}<br>"
      end
      flash[:alert] = error_mes.html_safe
      redirect_to project_path(@project)
    end
  end

  def destroy

  end

  def update

  end

  private
    def posts_params
      params.require(:post).permit(:post1, :post2, :post3, :post4, :post5).merge(user: current_user, project: @project )
    end
end
