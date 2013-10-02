class AdminMailer < ActionMailer::Base
  default to: Proc.new { Administrator.pluck(:email) },
          from: 'notification@example.com'
#requires admin
  def new_ngo_waiting_for_approval(ngo)
    @ngo = ngo
    @url  = root_url
    mail(subject: 'New NGO registration at Goodwork')
  end

  def pledge_received(ngo, donation)
  	@ngo = ngo
  	@donation = donation
  	@url = root_url
  	mail(subject: "#{@ngo.name} received a pledge from #{@donation.name}")
  end

end

