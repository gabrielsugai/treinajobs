class CommentsController < ApplicationController

  def create
    @user_profile = UserProfile.find(params[:user_profile_id])
    @comment = @user_profile.comments.new(params.require(:comment).permit(:user_profile_id, :text))

    @comment.headhunter_id = current_headhunter.id
    if @comment.save
      redirect_to @user_profile
    else
       @profile = UserProfile.find(params[:user_profile_id])
       render "user_profiles/show"
    end
  end
end