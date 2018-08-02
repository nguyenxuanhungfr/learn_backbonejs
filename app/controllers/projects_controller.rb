class ProjectsController < ApplicationController

  def index
    respond_to do |format|
      msg = Project.all
      format.json  { render :json => msg }
    end
  end
end
