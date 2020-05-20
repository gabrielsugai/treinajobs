class OpportunitiesController < ApplicationController
  def index
    @jobs = Job.all
    @opportunities = Opportunity.all
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
end