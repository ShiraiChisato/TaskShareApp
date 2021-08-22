class ManageController < ApplicationController
  def show
  end

  def create
    @project = Project.new(pro_params)
    #確認
    if @user.save
      redirect_to @project
    else
      error_mes = ""
      @user.errors.full_messages.each do |error|
        error_mes += "!#{error}<br>"
      end
      flash[:alert] = error_mes.html_safe
      render :new
    end
  end


  private
    def pro_params
      params.require(:project).parmit(:projectname, :projecticon, :projectnote)
    end
    def ass_params
      params.require(:associate).parmit(:UserID, :projectID, :Host)
    end
end
