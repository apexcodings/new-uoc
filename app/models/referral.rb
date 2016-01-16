class Referral < ActiveRecord::Base
  validates :email, :patient_name, :dob, :insurance, presence: true

  PHYSICIANS = [
    "David J. Bozak, D.O.",
    "Adam M. Budny, D.P.M.",
    "Eric M. Kephart, D.O.",
    "Joshua Port, M.D., President",
    "Shawn C. Saylor, D.O.",
    "Robert J. Singer, D.O.",
    "Jonathan P. Van Kleunen, M.D."
  ]

  OFFICES = ["Altoona", "Roaring Spring"]

  def time_seen
    if time_to_be_seen == "1_day"
      "1-2 Days"
    else
      "3-5 Days"
    end
  end

end
