class HomeController < ApplicationController
  def index
    @people = Person.includes(:status).all
    @status = current_person.statuses.new
    @statuses = Status.order("created_at desc").first(10)
    @more = Status.count > 10
    @projects = current_person.projects
  end
end
