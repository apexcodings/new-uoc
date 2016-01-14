class Appointment < ActiveRecord::Base
  validates :requestor_first_name, 
            :requestor_last_name, 
            :requestor_phone_prefix,
            :requestor_phone,
            :patient_first_name,
            :patient_last_name,
            :patient_phone_prefix,
            :patient_phone,
            presence: true

  INJURY_LOCATIONS = %w(Arm Foot Hand Hip Knee Shoulder Spine) 
  validates :injury_location, 
            inclusion: { in: INJURY_LOCATIONS }, 
            allow_blank: true

  PREFERRED_LOCATIONS = ["State College", "Altoona", "Lewistown", "Tyrone", "Huntingdon", "DuBois", "Bedford"]
  validates :preferred_location, 
            inclusion: { in: PREFERRED_LOCATIONS }, 
            allow_blank: true

  APPOINTMENT_TYPES = ["Orthopedics", "Workers Compensation", "Chiropractics", "Physical Therapy", "Pain Management"]
  validates :appointment_type, 
            inclusion: { in: APPOINTMENT_TYPES }, 
            allow_blank: true


  def requestor_name
    "#{requestor_first_name} #{requestor_mi unless requestor_mi.nil?} #{requestor_last_name}"
  end

  def requestor_phone_number
    "(#{requestor_phone_prefix}) #{requestor_phone}"
  end

  def patient_name
    "#{patient_first_name} #{patient_mi unless patient_mi.nil?} #{patient_last_name}"
  end

  def patient_phone_number
    "(#{patient_phone_prefix}) #{patient_phone}"
  end

  def prior_treatment_response
    prior_treatment ? "Yes" : "No"
  end

  def x_ray_response
    x_ray ? "Yes" : "No"
  end

  def insurance
    no_insurance ? "No Insurance" : "Yes"
  end

  def preferred_days
    preferred = { "Monday" => preferred_day_mo,
      "Tuesday" => preferred_day_tu, 
      "Wednesday" => preferred_day_we, 
      "Thursday" => preferred_day_th, 
      "Friday" => preferred_day_fr }

    preferred_list = []

    preferred.each do |k, v|
      if v == true
        preferred_list << k
      end
    end

    preferred_list
  end

  def preferred_times
    preferred = { "AM" => preferred_time_am, "PM" => preferred_time_pm}
    preferred_list = []

    preferred.each do |k, v|
      if v == true
        preferred_list << k
      end
    end

    preferred_list
  end


end



