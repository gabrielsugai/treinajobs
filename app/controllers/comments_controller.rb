class CommentsController < ApplicationController
  
  def show
    @comments = Comment.find(params[:user_profile_id])
  end

  def create
    @user_profile = UserProfile.find(params[:user_profile_id])
    @comment = @user_profile.comments.new(params.require(:comment).permit(:user_profile_id, :text))

    @comment.headhunter_id = current_headhunter.id
    @comment.save
    redirect_to @user_profile
  end
end