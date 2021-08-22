class ViewController < ApplicationController
  def show
    @view = project.find(params[:projectid])
  end

end
