class JobApplication < ActiveRecord::Base
  validates :last_name, :phone, :email, :job_id, :resume, presence: true

  # to prevent spam with hidden field
  attr_accessor :physical_address
  validates :physical_address, absence: true

  belongs_to :job

  has_attached_file :resume,
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :path => ":attachment/:id/:style.:extension",
    :url => ":s3_domain_url"

  validates_attachment :resume,
    :content_type => { :content_type => ['application/pdf',
                                         'application/msword',
                                         'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
                                         'text/plain'] },
                                         :size => { :less_than => 1.megabyte }

end
