class OpportunitiesController < ApplicationController
  before_action :visitor
  before_action :user_have_profile
  before_action :authenticate_headhunter!, only: [:feature_candidate, :feedback]
  before_action :authenticate_user!, only: [:new]
  
  def index
    @opportunities = current_user.user_profile.opportunities
  end

  def new
    @job = Job.find(params[:job_id])
    @opportunity = Opportunity.new()
  end

  def create
    @job = Job.find(params[:job_id])
    @opportunity = Opportunity.new(params.require(:opportunity).permit(:text))
    @opportunity.job_id = @job.id
    @opportunity.user_profile_id = current_user.user_profile.id
    if @opportunity.save
      flash[:alert] = "Processo realizado com sucesso!"
      redirect_to user_root_path
    else
      render :new
    end
  end

  def feature_candidate
    @opportunity = Opportunity.find(params[:id])
    @job = Job.find(params[:job_id])
    if @opportunity.not_feature? or @opportunity.rejected?
      @opportunity.candidate_feature!
    elsif @opportunity.candidate_feature?
      @opportunity.not_feature!
    end
    redirect_to candidates_job_path(@job)
  end

  def feedback
    @opportunity = Opportunity.find(params[:id])
    @job = Job.find(params[:job_id])
    @opportunity.feedback_message = params[:feedback_message]
    @opportunity.rejected!
    flash[:alert] = "Mensagem enviada com sucesso!"
    redirect_to candidates_job_path(@job)
  end
  
end