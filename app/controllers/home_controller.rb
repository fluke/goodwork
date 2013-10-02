class HomeController < ApplicationController
  before_action :authenticate_ngo!,  only: [:edit, :myitems, :done]
  
  def index
	end

  def about
  end
  
  def profile
    @ngo = Ngo.find(params[:id])
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
