class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def user_pledge_confirmation(ngo, donation)
  	@donation = donation
  	@ngo = ngo
  	@url = root_url
  	mail(to: @donation.email, subject: "Thank you for pledging here at Goodwork, we\'ve put you in contact with #{ngo.name}")
  end

end
