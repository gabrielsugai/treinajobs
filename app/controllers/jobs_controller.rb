class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end
  def show
    @job = Job.find(params[:id])
  end
  def new
    @job = Job.new()
  end
  def create
    @job = Job.new(params.require(:job).permit(:title, :description, :skills, :salary, :level, :limit_date, :local))
    @job.headhunter_id = current_headhunter.id
    @job.save
    redirect_to @job
  end

  def candidates
    @job = Job.find(params[:id])
  end

end