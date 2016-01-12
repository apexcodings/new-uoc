class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      Emailer.appointment_email(@appointment).deliver_now
      flash[:notice] = "Thank you for your submission!"
      redirect_to page_path("thank-you")
    else
      flash[:alert] = "There was an error while submitting this form. Please, see below."
      render :new
    end
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
