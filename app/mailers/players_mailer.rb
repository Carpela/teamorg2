class PlayersMailer < ActionMailer::Base
  default from: "from@example.com"

  def invites(email)
    mail to: email, subject: 'Invite'
  end
end
