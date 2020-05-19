class HomeController < ApplicationController
  
  def index
  end
  
  def companies_index
  end

  def user_index
    #@profile = UserProfile.find_by(user: current_user)
    @profile = current_user.user_profile
  end

  def headhunter_index
  end
  
end