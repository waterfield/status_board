class StatusesController < ApplicationController
  def create
    @status = Status.new params[:status]
    @status.person = current_person
    if @status.save
      flash[:notice] = "Your status has been updated"
    end
    redirect_to root_path
  end
end
