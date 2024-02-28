class DashboardController < ApplicationController
  def index
    if user_signed_in?
      # User is signed in, proceed to the welcome page with buttons
    else
      # User is not signed in, redirect to the login page
      redirect_to new_user_session_path
    end
  end
  
  def show
  end

  def my_courses
  end
end
