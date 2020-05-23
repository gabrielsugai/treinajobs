class JobOffersController < ApplicationController

  def index
    @offers = current_user.user_profile.job_offers
  end

  def new
    @job = Job.find(params[:job_id])
    @candidates = @job.user_profiles
    @opportunities = @job.opportunities
    @offer = JobOffer.new
  end

  def create
    @offer = JobOffer.new(params.require(:job_offer).permit(:user_profile_id, :start_date, :salary, 
                                                            :benefits, :function, :expectations, :job_id))
    @offer.save
    flash[:notice] = "Proposta enviar com sucesso!"
    redirect_to headhunter_root_path
  end

end