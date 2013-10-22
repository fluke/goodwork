class NewNGOWaitingForApprovalJob
	
  include SuckerPunch::Job

  # The perform method is in charge of our code execution when enqueued.
  def perform(ngo)
    AdminMailer.new_ngo_waiting_for_approval(ngo).deliver
    NgoMailer.wait_for_approval(ngo).deliver
  end

end