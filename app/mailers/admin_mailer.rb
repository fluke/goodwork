class AdminMailer < ActionMailer::Base
  default to: Proc.new { Ngo.where(:admin => true).pluck(:email) },
          from: 'notification@example.com'

  def new_ngo_waiting_for_approval(ngo)
    @ngo = ngo
    @url  = root_url
    mail(subject: 'Thank you for applying, we\'ll get back to you soon')
  end

end

