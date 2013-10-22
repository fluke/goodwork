class AdminController < ApplicationController
  before_action :authenticate_administrator!
  def index
    @ngos =  Ngo.all
	end
	
	def unapproved
	  @ngos = Ngo.where(:approved => false)
  end
  
	def approve
	  @n = Ngo.find_by_id(params[:id])
	  @n.approved = true
	  @n.save!
	  redirect_to request.referer

	  if @n.save!
      NgoMailer.approved(@n).deliver
    end

  end
  
  def unapprove
	  @n = Ngo.find_by_id(params[:id])
	  @n.approved = false
	  @n.save!
	  redirect_to request.referer

    if @n.save!
      NgoMailer.unapproved(@n).deliver
    end

  end
  
  def pending
	  @n = Donation.find_by_id(params[:id])
	  @n.status = 'pending'
	  @n.save!
	  redirect_to request.referer
  end
  
  def done
	  @n = Donation.find_by_id(params[:id])
	  @n.status = 'done'
	  @n.save!
	  redirect_to request.referer
  end
  
  def pending_donations
  @donations = Donation.order('id DESC')
  end
  
end
