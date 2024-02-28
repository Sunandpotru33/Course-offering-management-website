# app/controllers/courses_controller.rb
class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end
  
  def show
    @course = Course.find(params[:id])
  end

  def enroll
    @course = Course.find(params[:id])
    current_user.courses << @course
    redirect_to current_user
  end
end