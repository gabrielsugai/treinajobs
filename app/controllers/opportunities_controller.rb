class OpportunitiesController < ApplicationController

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
    @opportunity.save
    flash[:notice] = "Processo realizado com sucesso!"
    redirect_to user_root_path
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
    flash[:notice] = "Mensagem enviada com sucesso!"
    redirect_to candidates_job_path(@job)
  end
  
end