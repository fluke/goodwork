class DonationController < ApplicationController
  
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
       @ngo_list = Ngo.where(city: @donation.city, state: @donation.state, approved: true)
       @final_ngo_list = []
       @ngo_list.each do |ng|
         if ng.categories.include?(Category.find_by_id(@donation.category))
           @final_ngo_list << ng
         end
       end
       
       ngo_size = @final_ngo_list.size
       if ngo_size > 0
        @donation.ngo_id = @final_ngo_list.sample.id
       else
        flash[:notice] = "No NGOS found"
        redirect_to request.referer and return
       end
     
       respond_to do |format|
         if @donation.save
           @ngo = Ngo.find_by_id(@donation.ngo_id)
           send_mail( @ngo, @donation)
           format.html { redirect_to donation_done_path, notice: "Sucess! NGO assigned to your item is #{Ngo.find_by_id(@donation.ngo_id).name}, #{Ngo.find_by_id(@donation.ngo_id).city}. They will contact you soon!" }
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

  def send_mail(ngo, donation)
    AdminMailer.pledge_received(@ngo, @donation).deliver
    NgoMailer.pledge_received(@ngo, @donation).deliver
    UserMailer.user_pledge_confirmation(@ngo, @donation).deliver
  end

end