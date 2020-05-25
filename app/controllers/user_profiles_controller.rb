class UserProfilesController < ApplicationController
  before_action :visitor
  before_action :user_have_profile, except: [:new, :create]
  
  def show
    @profile = UserProfile.find(params[:id])
    @comment = Comment.new()
  end

  def new
    @user_profile = UserProfile.new
  end
  
  def create
    @user_profile = UserProfile.new(profile_params)
    @user_profile.user_id = current_user.id
    if @user_profile.save
      flash[:alert] = "Perfil completado com sucesso!"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user_profile = current_user.user_profile
  end

  def update
    @user_profile = current_user.user_profile
    if @user_profile.update(profile_params)
      flash[:alert] = 'Perfil atualizado com sucesso!'
      redirect_to @user_profile
    else
      render :new
    end
  end

  def myapplys
    @profile = UserProfile.find(current_user.id)
  end

  private

  def profile_params
    params.require(:user_profile).permit(:avatar, :name, :social_name, :date_of_birth, 
      :schooling, :description, :experience)
  end
  
end