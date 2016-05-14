class Contact < ActiveRecord::Base
# to prevent spam with hidden field
  attr_accessor :address
  validates :address, absence: true

  validates :last_name, :message, presence: true
  validates :email, presence: true, format: /\A\S+@\S+\z/
end
