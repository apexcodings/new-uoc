class ReferralsController < ApplicationController

  require "csv"

  before_action :require_signin, except: [:create]
  before_action :require_admin, except: [:create]

  def index
    #@referrals = Referral.order(created_at: :desc)
    @referrals = Referral.unprocessed
  end

  def processed_referrals
    @referrals = Referral.processed
  end

  def show
    @referral = Referral.find(params[:id])
  end

  def create
    @referral = Referral.new(referral_params)
    if @referral.save
      Emailer.referral_email(@referral).deliver_now
      flash[:notice] = "Thank you for your submission!"
      redirect_to page_path("thank-you")
    else
      flash[:alert] = "There was an error while submitting this form. Please, see below."
      @page = Page.find_by(slug: "referring-physicians")
      render template: "pages/show"
    end
  end

  def destroy
    @referral = Referral.find(params[:id])
    @referral.destroy
    flash[:notice] = "Referral successfully deleted!"
    redirect_to referrals_path
  end

  def destroy_all
    Referral.delete_all
    flash[:notice] = "All Referrals successfully deleted!"
    redirect_to referrals_path
  end

  def update
    @referral = Referral.find(params[:id])
    @referral.update(processed: true)
    redirect_to referrals_path
  end

  def download
    @referrals = Referral.all

    csv_string = CSV.generate do |csv|
      # header row
      csv << ["ID",  "Practice",  "Referring Physician",  "Name",  "Phone Number",  "Email",  "Fax", "Patient Name", "Date of Birth", "Patient Phone number", "Patient Alternate Phone Number", "Patient Email", "Employer", "Patient Insurance", "Symptoms", "Prior Surgery", "Workers Comp", "Bone Scan", "Bone Scan where", "CT Scan", "CT Scan where", "MRI", "MRI where", "EMG", "EMG where", "X-rays", "X-rays where", "Cast", "Cast where", "Preferred Physician", "Office Preference", "Requested time" ]

      # data rows
      @referrals.each do |referral|
        csv << [referral.id, 
                referral.practice,
                referral.physician,
                referral.name,
                referral.phone,
                referral.email,
                referral.fax,
                referral.patient_name,
                referral.dob,
                referral.patient_phone,
                referral.patient_phone_alt,
                referral.patient_email,
                referral.employer,
                referral.insurance,
                referral.diagnosis,
                referral.prior_surgery,
                referral.workers_comp,
                referral.bone_scan,
                referral.bone_scan_where,
                referral.ct_scan,
                referral.ct_scan_where,
                referral.mri,
                referral.mri_where,
                referral.emg,
                referral.emg_where,
                referral.x_rays,
                referral.x_rays_where,
                referral.cast,
                referral.cast_where,
                referral.preferred_physician,
                referral.preferred_office,
                referral.time_seen ]
      end
    end

    # send it to the browsah
    send_data csv_string,
              :type => 'text/csv; charset=iso-8859-1; header=present',
              :disposition => "attachment; filename=referrals.csv"
  end

  private

  def referral_params
    # hidden field for spam :address
    params.require(:referral).permit( :practice, :physician, :name, :phone,
      :email, :fax, :patient_name, :dob, :patient_phone, :patient_phone_alt,
      :patient_email, :employer, :insurance, :diagnosis, :prior_surgery,
      :workers_comp, :bone_scan, :bone_scan_where, :ct_scan, :ct_scan_where,
      :mri, :mri_where, :emg, :emg_where, :x_rays, :x_rays_where, :cast,
      :cast_where, :preferred_physician, :preferred_office, :time_to_be_seen, :address)
  end
end
