class Review < ActiveRecord::Base
  validates :last_name, :message, presence: true
  validates :email, presence: true, format: /\A\S+@\S+\z/
end
