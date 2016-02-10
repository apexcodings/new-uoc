class ReferralsController < ApplicationController

  before_action :require_signin, except: [:create]
  before_action :require_admin, except: [:create]

  def index
    @referrals = Referral.order(created_at: :desc)
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

  private

  def referral_params
    params.require(:referral).permit( :practice, :physician, :name, :phone,
      :email, :fax, :patient_name, :dob, :patient_phone, :patient_phone_alt,
      :patient_email, :employer, :insurance, :diagnosis, :prior_surgery,
      :workers_comp, :bone_scan, :bone_scan_where, :ct_scan, :ct_scan_where,
      :mri, :mri_where, :emg, :emg_where, :x_rays, :x_rays_where, :cast,
      :cast_where, :preferred_physician, :preferred_office, :time_to_be_seen)
  end
end
