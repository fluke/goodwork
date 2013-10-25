class HomeController < ApplicationController
  before_action :authenticate_ngo!,  only: [:edit, :myitems, :done]

  require 'approval_job'
  
  def index
  end

  def terms
	end

  def about
    
  end

  def privacy
    
  end

  def directory
    if params[:search]
        @ngos = Ngo.search((params[:search]).to_s.downcase).city_search(params[:city].to_s.downcase)
      else
        @ngos = Ngo.all
       end
  end
  def profile
    @ngo = Ngo.friendly.find(params[:id])
  end
  
  def myitems
    if (current_ngo.id == (params[:id]).to_i)
    @ngo = Ngo.find(params[:id])
    @donations = Donation.where(:ngo_id => current_ngo.id)
    else
      flash[:notice] = "Not your ngo"
      redirect_to root_url
      end
  end
  
  def done
    if (current_ngo.id == (params[:id]).to_i)
  	  @n = Donation.find_by_id(params[:item_id])
  	  @n.status = 'done'
  	  @n.save!
  	  redirect_to request.referer
	  else
	    flash[:notice] = "Not your ngo"
      redirect_to root_url
	  end
  end
  
  def welcome
  end
  
end
