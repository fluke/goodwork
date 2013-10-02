class HomeController < ApplicationController
  before_action :authenticate_ngo!,  only: [:edit, :myitems]
  
  def index
	end

  def about
  end
  
  def profile
    @ngo = Ngo.find(params[:ngo_id])
  end
  
  def edit
    if current_ngo.id == params[:ngo_id]
    @ngo = Ngo.find(params[:ngo_id])
  else
    flash[:notice] = "Not your ngo"
    redirect_to request.referer and return
    end
  end
  
  def myitems
    if current_ngo.id == params[:ngo_id]
    @ngo = Ngo.find(params[:ngo_id])
    @donations = Donation.where(:ngo_id => current_ngo.id)
    else
      flash[:notice] = "Not your ngo"
      redirect_to request.referer and return
      end
  end
end
