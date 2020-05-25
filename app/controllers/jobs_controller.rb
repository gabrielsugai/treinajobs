class JobsController < ApplicationController
  before_action :visitor
  before_action :user_have_profile
  before_action :authenticate_headhunter!, only: [:new, :create, :candidates, :end_job]

  def index
    @jobs = Job.all
  end
  def show
    @job = Job.find(params[:id])
    if @job.limit_date < Date.today
      @job.ended!
    end
  end
  def new
    @job = Job.new()
  end

  def create
    @job = Job.new(params.require(:job).permit(:title, :description, :skills, :salary, :level, :limit_date, :local))
    @job.headhunter_id = current_headhunter.id
    if @job.save
      flash[:alert] = "Vaga cadastrada com sucesso!"
      redirect_to @job
    else
      render :new
    end
  end

  def candidates
    @job = Job.find(params[:id])
    @opportunities = Opportunity.all
  end

  def end_job
    @job = Job.find(params[:id])
    @job.ended!
    flash[:alert] = "Processo finalizado com sucesso!"
    redirect_to headhunter_root_path
  end
end