class PledgeReceivedJob
  include SuckerPunch::Job

  # The perform method is in charge of our code execution when enqueued.
  def perform(ngo, donation)
    AdminMailer.pledge_received(ngo, donation).deliver
    NgoMailer.pledge_received(ngo, donation).deliver
    UserMailer.user_pledge_confirmation(ngo, donation).deliver
  end

end