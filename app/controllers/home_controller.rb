class HomeController < ApplicationController
  def index
    if params[:approved] == "false"
      @ngos = Ngo.find_all_by_approved(false)
  	else
	    @ngos = Ngo.find_all_by_approved(true)
	  end
	end

  def about
  end
end
