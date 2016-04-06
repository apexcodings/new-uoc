class Job < ActiveRecord::Base
  validates :name, presence: true
end
