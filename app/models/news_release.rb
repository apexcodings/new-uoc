class NewsRelease < ActiveRecord::Base
  validates :title, presence: true

  scope :recent, -> { order(created_at: :desc).limit(5) }

  def tease
    Nokogiri::HTML.parse(body).css('p').first.to_s.html_safe #.text
  end

  self.per_page = 5
end
