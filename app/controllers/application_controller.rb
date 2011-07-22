class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_person!
  before_filter :get_current_project
  
  private
  
  def get_current_project
    if session[:project_id]
      @project = Project.find session[:project_id]
    else
      @project = nil
    end
  end
end
