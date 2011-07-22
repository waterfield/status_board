class HomeController < ApplicationController
  def index
    @people = Person.includes(:status).all
  end
end
