class NewsRelease < ActiveRecord::Base
  validates :title, presence: true
end
