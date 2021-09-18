class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
    @member = @project.users
  end

  def create
    @project = Project.new(projects_params)
    #確認
    if @project.save
      @associate = Associate.new(user: @current_user.id, project: @project.id, host: true)
      redirect_to @project
    else
      error_mes = ""
      @project.errors.full_messages.each do |error|
        error_mes += "!#{error}<br>"
      end
      flash[:alert] = error_mes.html_safe
      redirect_to projects_new
    end
  end

  def update

  end

  def destroy

  end

  private
    def projects_params
      params.require(:project).permit(:name, :note, :topic1, :topic2, :topic3, :topic4, :topic5)
  end
end
