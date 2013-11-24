class Donation < ActiveRecord::Base
  validates_presence_of :name, :address1 , :address2 , :city, :ph_no, :state, :category, :email, :description, :full_name
  validates_format_of :email,  :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => "Bad Email format"
  validates :ph_no, length: { is: 10 }
  has_many :comments
end
