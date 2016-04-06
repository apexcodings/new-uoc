class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:notice] = "Job successfully created!"
      redirect_to jobs_url
    else
      flash[:alert] = "There were some errors, see below"
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      flash[:notice] = "Job successfully updated!"
      redirect_to jobs_url
    else
      flash[:alert] = "There were some errors, see below"
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_url
  end

  private

  def job_params
    params.require(:job).permit(:name, :description)
  end
end
