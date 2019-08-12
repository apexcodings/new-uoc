module SlidesHelper
  def https_url_for(slide)
    if Rails.env == 'development'
      bucket = "com.uocdevelopment/"
      bucket_regexp = /com\.uocdevelopment\./
    elsif Rails.env == 'production'
      bucket = "com.uocproduction/"
      bucket_regexp = /com\.uocproduction\./
    end

    https_endpoint = slide.photo.url(:large).gsub(bucket_regexp, '')
    https_endpoint.insert(35, bucket)
    https_endpoint
  end
end
