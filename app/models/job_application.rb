class JobApplication < ActiveRecord::Base
  validates :last_name, :phone, :email, :job_id, presence: true

# to prevent spam with hidden field
  attr_accessor :physical_address
  validates :physical_address, absence: true

  belongs_to :job
end
