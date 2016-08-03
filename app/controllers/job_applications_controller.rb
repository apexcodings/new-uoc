class JobApplicationsController < ApplicationController

  before_action :require_signin, except: [:new, :create]
  before_action :require_admin, except: [:new, :create]

  def index
    @job_applications = JobApplication.order(created_at: :desc)
  end

  def show
    @job_application = JobApplication.find(params[:id])
    @job = @job_application.job
  end

  def new
    @job = Job.find(params[:job_id])
    @job_application = @job.job_applications.new
  end

  def create
    @job = Job.find(params[:job_id])
    @job_application = @job.job_applications.new(job_application_params)

    if @job_application.save
      #Emailer.job_application_email(@job_application).deliver_now
      flash[:notice] = "Job Application received correctly!"
      redirect_to page_url("thank-you")
    else
      flash[:alert] = "Your application could not be submitted. Please fix the errors below."
      render :new
    end
  end

  def destroy
    @job_application = JobApplication.find(params[:id])
    @job_application.destroy
    flash[:alert] = "Job application removed."
    redirect_to job_applications_url
  end

  private

  def job_application_params
    params.require(:job_application).permit(:job_id, :first_name, :last_name, :phone, :email, :physical_address,
            :nickname, :address, :apt, :city, :us_state, :zip, 
            :full_time, :part_time, :available_as_of, :emergency_name, 
            :emergency_day_phone, :emergency_night_phone, :employer1, 
            :supervisor1, :employer1_phone, :from1, :to1, :salary1, 
            :employer_address1, :title1, :reason1, :employer2, :supervisor2, 
            :employer2_phone, :from2, :to2, :salary2, :employer_address2, :title2, 
            :reason2, :employer3, :supervisor3, :employer3_phone, :from3, :to3, 
            :salary3, :employer_address3, :title3, :reason3, :high_school_years, 
            :high_school_name, :high_school_degree, :tech_years, 
            :tech_name, :tech_degree, :trade_years, :trade_name, 
            :trade_degree, :business_years, :business_name, :business_degree, 
            :college_years, :college_name, :college_degree, :graduate_years, 
            :graduate_name, :graduate_degree, :cert1, :cert_state1, :cert_date1, 
            :cert2, :cert_state2, :cert_date2, :cert3, :cert_state3, :cert_date3, 
            :cert4, :cert_state4, :cert_date4, :convicted, :convicted_explanation, 
            :learn_ad, :learn_ad_explanation, :learn_employee, 
            :learn_employee_explanation, :learn_other, :learn_other_explanation, 
            :previously_worked, :previously_worked_explanation, 
            :reference1_name, :reference1_relationship, :reference1_address, 
            :reference1_phone, :reference2_name, :reference2_relationship, 
            :reference2_address, :reference2_phone, :reference3_name, 
            :reference3_relationship, :reference3_address, 
            :reference3_phone, :signature, :sig_date)
  end
end
