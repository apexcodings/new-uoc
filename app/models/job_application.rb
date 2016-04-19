class JobApplication < ActiveRecord::Base
  validates :last_name, :phone, :email, presence: true
  belongs_to :job
end
