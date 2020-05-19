class UserProfilesController < ApplicationController
  def new
    @user_profile = UserProfile.new
  end
  
  def create
    @user_profile = UserProfile.new(params.require(:user_profile).permit(:name, :social_name, :date_of_birth, 
                                                                        :schooling, :description, :experience))
    @user_profile.user_id = current_user.id
    @user_profile.save
    flash[:notice] = "Perfil completado com sucesso!"
    redirect_to root_path
  end
end