class JobOffersController < ApplicationController

  def index
    @offers = current_user.user_profile.job_offers
  end

  def show
    @offer = JobOffer.find(params[:id])
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

  def accept_message
    @offer = JobOffer.find(params[:id])
  end

  def accept_offer
    message = params[:job_offer]
    message = message[:message]
    @current_offer = JobOffer.find(params[:id])
    @current_offer.accepted!
    @current_offer.message = message
    @user_offers = current_user.user_profile.job_offers
    @user_offers.each do |offer|
      if offer.id != @current_offer.id
        offer.denied!
      end
    end
    flash[:notice] = "Processo finalizado com sucesso!"
    redirect_to user_root_path
  end

  def denied_message
    @offer = JobOffer.find(params[:id])
  end

  def denied_offer
    message = params[:job_offer]
    message = message[:message]
    @current_offer = JobOffer.find(params[:id])
    @current_offer.denied!
    @current_offer.message = message
    flash[:notice] = "Processo finalizado com sucesso!"
    redirect_to user_root_path
  end

end