class NewsRelease < ActiveRecord::Base
  validates :title, presence: true

  def tease
    Nokogiri::HTML.parse(body).css('p').first.text
  end
end
