class ProjectsController < ApplicationController
  skip_before_filter :get_current_project
  
  def index
    @projects = Project.all
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new params[:project]
    @project.people << current_person if params[:member]
    if @project.save
      flash[:notice] = 'Added new project'
      redirect_to root_path
    else
      render :action => :new
    end
  end
  
  def join
    @project = Project.find params[:id]
    unless @project.people.include? current_person
      @project.people << current_person
    end
    if @project.save
      flash[:notice] = "You've joined the #{@project.name} project"
    else
      flash[:error] = "Oops, something went wrong: #{@project.errors.full_messages.join(', ')}"
    end
    redirect_to projects_path
  end
  
  def leave
    @project = Project.find params[:id]
    @project.people.delete current_person
    if @project.save
      flash[:notice] = "You've left the #{@project.name} project"
    else
      flash[:error] = "Oops, something went wrong: #{@project.errors.full_messages.join(', ')}"
    end
    redirect_to projects_path
  end
  
  def select
    if params[:id] == 'all'
      session.delete :project_id
    else
      session[:project_id] = params[:id]
    end
    redirect_to :back
  end
end
