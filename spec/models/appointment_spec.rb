require 'rails_helper'
require 'support/attributes'

RSpec.describe Appointment do
  it "is valid with default attributes" do
    appointment = Appointment.new(appointment_attributes)
    expect(appointment.valid?).to eq(true)
  end

  it "is not processed by default" do
    appointment = Appointment.new(appointment_attributes)
    expect(appointment.processed?).to eq(false)
  end

  it "requires a requestor first name" do
    appointment = Appointment.new(requestor_first_name: "")
    appointment.valid?
    expect(appointment.errors[:requestor_first_name].any?).to eq(true)
  end

  it "requires a requestor last name" do
    appointment = Appointment.new(requestor_last_name: "")
    appointment.valid?
    expect(appointment.errors[:requestor_last_name].any?).to eq(true)
  end

  it "requires a requestor phone prefix" do
    appointment = Appointment.new(requestor_phone_prefix: "")
    appointment.valid?
    expect(appointment.errors[:requestor_phone_prefix].any?).to eq(true)
  end

  it "requires a requestor phone" do
    appointment = Appointment.new(requestor_phone: "")
    appointment.valid?
    expect(appointment.errors[:requestor_phone].any?).to eq(true)
  end

  it "requires a patient first name" do
    appointment = Appointment.new(patient_first_name: "")
    appointment.valid?
    expect(appointment.errors[:patient_first_name].any?).to eq(true)
  end

  it "requires a patient last name" do
    appointment = Appointment.new(patient_last_name: "")
    appointment.valid?
    expect(appointment.errors[:patient_last_name].any?).to eq(true)
  end

  it "requires a patient phone prefix" do
    appointment = Appointment.new(patient_phone_prefix: "")
    appointment.valid?
    expect(appointment.errors[:patient_phone_prefix].any?).to eq(true)
  end

  it "requires a patient phone" do
    appointment = Appointment.new(patient_phone: "")
    appointment.valid?
    expect(appointment.errors[:patient_phone].any?).to eq(true)
  end

  it "is valid when the injury location is in the approved list" do
    locations = %w(Arm Foot Hand Hip Knee Shoulder Spine) 

    locations.each do |location|
      appointment = Appointment.new(injury_location: location)
      appointment.valid?
      expect(appointment.errors[:injury_location].any?).to eq(false)
    end
  end

  it "is not valid when the injury location is not in the approved list" do
    locations = %w(Head Nose Chest Ear)

    locations.each do |location|
      appointment = Appointment.new(injury_location: location)
      appointment.valid?
      expect(appointment.errors[:injury_location].any?).to eq(true)
    end
  end

  it "is valid when the preferred location is in the approved list" do
    preferred_locations = ["State College", "Altoona", "Reedsville", "Tyrone", "Huntingdon", "DuBois", "Bedford", "Ebensburg"]

    preferred_locations.each do |location|
      appointment = Appointment.new(preferred_location: location)
      appointment.valid?
      expect(appointment.errors[:preferred_location].any?).to eq(false)
    end
  end

  it "is not valid when the preferred location is not in the approved list" do
    preferred_locations = ["New York City", "Chicago", "L.A."]

    preferred_locations.each do |location|
      appointment = Appointment.new(preferred_location: location)
      appointment.valid?
      expect(appointment.errors[:preferred_location].any?).to eq(true)
    end
  end

  it "is valid when the appointment type is in the approved list" do
    appointment_types = ["Orthopedics", "Workers Compensation", "Chiropractics", "Physical Therapy", "Pain Management"]

    appointment_types.each do |appt_type|
      appointment = Appointment.new(appointment_type: appt_type)
      appointment.valid?
      expect(appointment.errors[:appointment_type].any?).to eq(false)
    end
  end

  it "is not valid when the appointment type is not in the approved list" do
    appointment_types = ["Cabbage", "Resole your shoes", "Fishing"]

    appointment_types.each do |appt_type|
      appointment = Appointment.new(appointment_type: appt_type)
      appointment.valid?
      expect(appointment.errors[:appointment_type].any?).to eq(true)
    end
  end

  it "returns the preferred days" do
    appointment1 = Appointment.new(preferred_day_mo: true, preferred_day_we: true)
    appointment2 = Appointment.new(preferred_day_tu: true, preferred_day_fr: true)

    appointment1_days = ["Monday", "Wednesday"]
    appointment2_days = ["Tuesday", "Friday"]

    appointment1_days.each do |day|
      expect(appointment1.preferred_days).to include(day)
    end

    appointment2_days.each do |day|
      expect(appointment2.preferred_days).to include(day)
    end
  end

  it "doesn't return the wrong preferred days" do
    appointment = Appointment.new(preferred_day_mo: true, preferred_day_we: true)

    correct_days = ["Monday", "Wednesday"]
    wrong_days = ["Tuesday", "Thursday", "Friday"]

    correct_days.each do |day|
      expect(appointment.preferred_days).to include(day)
    end

    wrong_days.each do |day|
      expect(appointment.preferred_days).not_to include(day)
    end
  end

  it "returns the preferred time of day" do
    appointment = Appointment.new(preferred_time_am: true)

    right_time = ["AM"]
    wrong_time = ["PM"]

    right_time.each do |time|
      expect(appointment.preferred_times).to include(time)
    end

    wrong_time.each do |time|
      expect(appointment.preferred_times).not_to include(time)
    end
  end

end
