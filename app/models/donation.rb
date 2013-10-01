class Donation < ActiveRecord::Base
  validates_presence_of :name, :address1 , :address2 , :city, :ph_no, :state, :category, :email, :description, :full_name
  validates_format_of :email, :with => /@/
end
