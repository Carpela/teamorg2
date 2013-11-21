class PlayersMailer < ActionMailer::Base
  default from: "keiran@carpela.com"

  def invites(game_player)
    @game_player = game_player
    @game = @game_player.game
    mail to: game_player.player.email, subject: 'Invite'
  end

  def chasing_up(game_player)
    @game_player = game_player
    @game = @game_player.game
    mail to: game_player.player.email, subject: 'Invite'
  end


end
