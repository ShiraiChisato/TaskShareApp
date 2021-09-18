class AssociatesController < ApplicationController
  def show
    @associate = Associate.find(params[:name])
  end
end
