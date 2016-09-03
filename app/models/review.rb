class Review < ActiveRecord::Base
  validates :last_name, :message, presence: true
  validates :email, presence: true, format: /\A\S+@\S+\z/

  scope :published, -> { where(approved: true).order(created_at: :desc) }
end
