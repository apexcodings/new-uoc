class JobApplicationsController < ApplicationController
  def new
    @job = Job.find(params[:job_id])
    @job_application = @job.job_applications.new
  end

  def create
    @job = Job.find(params[:job_id])
    @job_application = @job.job_applications.new(job_application_params)

    if @job_application.save
      Emailer.job_application_email(@job_application).deliver_now
      flash[:notice] = "Job Application received correctly!"
      redirect_to page_url("thank-you")
    else
      flash[:alert] = "Your application could not be submitted. Please fix the errors below."
      render :new
    end
  end

  private

  def job_application_params
    params.require(:job_application).permit(:first_name, :last_name, :phone, :email)
  end
end
