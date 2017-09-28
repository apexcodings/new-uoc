class Slide < ActiveRecord::Base
	has_attached_file :photo,
    styles: { large: "940x355>", thumb: "235x90>" },
		:storage => :s3,
		:s3_credentials => "#{Rails.root}/config/s3.yml",
		:path => ":attachment/:id/:style.:extension",
		:url => ":s3_domain_url"

	validates_attachment :photo,
		:content_type => { :content_type => ['image/jpeg', 'image/png'] },
		:size => { :less_than => 1.megabyte }

  scope :by_position, -> { order(:position) }
end
