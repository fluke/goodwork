class DonationController < ApplicationController
  
  def new
     @donation = Donation.new
     @donation.state = Carmen::Country.coded('IN').subregions.first
  end
   
  def create
    @donation = Donation.new(donation_params)
    @donation.status = 'pending'
       
    respond_to do |format|
      if @donation.save
        send_mail(@donation)
        format.html { redirect_to donation_done_path, notice: "Success! Your item has been posted to the board." }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def show
    @d = Donation.find_by_id(params[:id])
  end
     
  def done
  end

  def board
    #authenticate_ngo!
    @donations = Donation.order('id DESC')
  end
     
  require 'pledge_received_job'
     
private

  def donation_params
    params.require(:donation).permit(:name, :address1, :address2, :city, :state, :category, :email, :description, :full_name, :ph_no)
  end

  def send_mail(donation)
    # We call our sucker punch job asynchronously using "async"
      ::PledgeReceivedJob.new.async.perform(donation)
      flash[:success] = 'Sucker Punch!'
  end

end