class ApplicationController < ActionController::Base

  def visitor
    if not user_signed_in?
      if not headhunter_signed_in?
        redirect_to root_path
      end
    end
  end

  def user_have_profile
    if user_signed_in?
      profile = current_user.user_profile
      if not profile
        redirect_to user_root_path
      end
    end
  end

end
