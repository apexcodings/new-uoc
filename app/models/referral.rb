class Referral < ActiveRecord::Base
  validates :email, :patient_name, :dob, :insurance, presence: true

# to prevent spam with hidden field
  attr_accessor :address
  validates :address, absence: true

  scope :unprocessed, -> { Referral.where(processed: false).order(created_at: :desc) }
  scope :processed, -> { Referral.where(processed: true).order(created_at: :desc) }

  PHYSICIANS = [
    "Gregory M. Bailey",
    "Bradley A. Barter",
    "David J. Boak",
    "Adam M. Budny",
    "Kenneth L. Cherry",
    "Todd B. Cousins",
    "Michael Doss",
    "Thomas J. Ellis",
    "Eric M. Kephart",
    "Fred K. Khalouf",
    "Paul D. Lamb",
    "Alexis N. Ley",
    "Christopher J. Lincoski",
    "Christopher McClellan",
    "Joshua Port",
    "Douglas E. Roeshot",
    "Edwin J. Rogusky",
    "Angela W. Rowe",
    "Shawn C. Saylor",
    "Paul R. Sensiba",
    "Robert J. Singer",
    "Joel A. Torretti",
    "William A. Tyndall",
    "Jonathan P. Van Kleunen",
    "Christopher Varacallo",
    "Keith M. Zora" ]



  OFFICES = [
    "State College",
    "Altoona",
    "Roaring Springs",
    "Bedford",
    "Huntingdon",
    "Tyrone",
    "Dubois",
    "Lewistown" ]


  def time_seen
    if time_to_be_seen == "1_day"
      "1-2 Days"
    else
      "3-5 Days"
    end
  end

end
