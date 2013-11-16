class PlayersMailer < ActionMailer::Base
  default from: "from@example.com"

  def invites(game_player)
    @game_player = game_player
    mail to: game_player.player.email, subject: 'Invite'
  end
end
