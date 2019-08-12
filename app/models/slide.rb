class Slide < ActiveRecord::Base
	has_attached_file :photo,
    styles: { large: "940x355>", thumb: "235x90>" },
		:storage => :s3,
		:s3_credentials => "#{Rails.root}/config/s3.yml",
    :s3_protocol => :https,
    :s3_host_name => 's3.us-east-1.amazonaws.com',
		:path => ":attachment/:id/:style.:extension",
		:url => ":s3_domain_url"



	validates_attachment :photo,
		:content_type => { :content_type => ['image/jpeg', 'image/png'] },
		:size => { :less_than => 1.megabyte }

  scope :by_position, -> { order(:position) }
end




# config.paperclip_defaults = {
#   storage: :s3,
#   url: ':s3_domain_url',
#   path: ':class/:attachment/:id/:style.:extension',
#   s3_region: ENV.fetch('AWS_REGION'),
#   s3_credentials: {
#     bucket: ENV.fetch('S3_BUCKET_NAME'),
#     access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
#     secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
#     s3_host_name: ENV.fetch('S3_ENDPOINT'),
#   }
# }
