class StatusesController < ApplicationController
  def index
    @statuses = Status.order("created_at desc").all
  end
  
  def create
    @status = Status.new params[:status]
    @status.person = current_person
    if @status.save
      flash[:notice] = "Your status has been updated"
    end
    redirect_to root_path
  end
end
