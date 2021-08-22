class ManageController < ApplicationController
  def show
    @project = Project.new
  end

  def create
    @project = Project.new(projects_params)
    #確認
    if @project.save
      redirect_to @project
    else
      error_mes = ""
      @project.errors.full_messages.each do |error|
        error_mes += "!#{error}<br>"
      end
      flash[:alert] = error_mes.html_safe
      render :show
    end
  end


  private
    def projects_params
      params.require(:project).parmit(:projectname, :projecticon, :projectnote)
  end
end
