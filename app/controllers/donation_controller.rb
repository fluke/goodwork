class DonationController < ApplicationController
  require 'carmen'
  include Carmen
  
  def new
     @donation = Donation.new
     @donation.state = Carmen::Country.coded('IN').subregions.first
     @donation.category = Category.all.first
   end
   
   def create
       @donation = Donation.new(donation_params)
       @donation.state = @donation.state
       @donation.city = @donation.city.capitalize.to_s
       @donation.status = 'pending'
       respond_to do |format|
         if @donation.save
           format.html { redirect_to donation_done_path, notice: 'Sucess!' }
         else
           format.html { render action: 'new' }
         end
    end
  end
     
  def done
  end
     
     
private
def donation_params
  params.require(:donation).permit(:name, :address1, :address2, :city, :state, :category, :email, :description, :full_name, :ph_no)
end

end