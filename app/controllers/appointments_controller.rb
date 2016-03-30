class AppointmentsController < ApplicationController

  require "csv"

  before_action :require_signin, except: [:create]
  before_action :require_admin, except: [:create, :index, :show, :destroy]

  def index
    if current_user.workers_comp?
      @appointments = Appointment.unprocessed.workers_comp
    else
      @appointments = Appointment.unprocessed
    end
  end

  def processed_appointments
    @appointments = Appointment.processed
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      Emailer.appointment_email(@appointment).deliver_now
      flash[:notice] = "Thank you for your submission!"
      redirect_to page_path("thank-you")
    else
      flash[:alert] = "There was an error while submitting this form. Please, see below."
      @page = Page.find_by(slug: "appointments")
      render template: "pages/show"
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    flash[:notice] = "Appointment successfully deleted!"

    if @appointment.processed?
      redirect_to processed_appointments_path
    else
      redirect_to appointments_path
    end
  end

  def destroy_all
    Appointment.unprocessed.delete_all
    flash[:notice] = "All unprocessed Appointments successfully deleted!"
    redirect_to appointments_path
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update(processed: true)
    redirect_to appointments_path
  end

  def download
    @appointments = Appointment.all

    csv_string = CSV.generate do |csv|
      # header row
      csv << ["ID",  "Requestor Name",  "Requestor Phone",  "Requestor Email",  "Time to reach",  "Patient Name",  "Patient Phone", "Address 1", "Address 2", "City", "State", "ZIP", "DOB", "Gender", "Injury Location", "Injury Location Other", "Injury Date", "Prior Treatment", "X ray", "No Insurance", "Insurance plan name", "Insurance Policy Number", "Preferred Location", "Preferred Days", "Preferred Times", "Appointment Type", "Questions", "Created at", "Processed"]

      # data rows
      @appointments.each do |appointment|
        csv << [appointment.id, 
            appointment.requestor_name, 
            appointment.requestor_phone_number, 
            appointment.requestor_email, 
            appointment.requestor_time_to_reach, 
            appointment.patient_name, 
            appointment.patient_phone_number, 
            appointment.address1, 
            appointment.address2, 
            appointment.city, 
            appointment.us_state, 
            appointment.zip, 
            appointment.dob, 
            appointment.gender, 
            appointment.injury_location, 
            appointment.injury_location_other, 
            appointment.injury_date, 
            appointment.prior_treatment, 
            appointment.x_ray, 
            appointment.no_insurance, 
            appointment.insurance_plan_name, 
            appointment.insurance_policy_number, 
            appointment.preferred_location, 
            appointment.preferred_days.join(" - "),
            appointment.preferred_times.join(" - "),
            appointment.appointment_type, 
            appointment.questions, 
            appointment.created_at,
            appointment.processed]
      end
    end

    # send it to the browsah
    send_data csv_string,
              :type => 'text/csv; charset=iso-8859-1; header=present',
              :disposition => "attachment; filename=appointments.csv"
  end

  private

  def appointment_params
    params.require(:appointment).permit(:requestor_first_name, 
        :requestor_last_name, :requestor_mi, :requestor_phone_prefix, 
        :requestor_phone, :requestor_email, :requestor_time_to_reach,
        :patient_first_name, :patient_mi, :patient_last_name, :patient_phone_prefix,
        :patient_phone, :address1, :address2, :city,
        :us_state, :zip, :dob, :gender,
        :injury_location, :injury_location_other, :injury_date, :prior_treatment,
        :x_ray, :no_insurance, :insurance_plan_name, :insurance_policy_number,
        :preferred_location, :preferred_day_mo, :preferred_day_tu, 
        :preferred_day_we, :preferred_day_th, :preferred_day_fr,
        :preferred_time_am, :preferred_time_pm, :appointment_type, :questions )
  end
end
