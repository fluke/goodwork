class Donation < ActiveRecord::Base
  validates_presence_of :name, :address1 , :address2 , :city, :state, :category, :ph_no, :email, :description, :full_name
end
