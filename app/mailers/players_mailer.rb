class PlayersMailer < ActionMailer::Base
  default from: "keiran@carpela.com"

  def invites(game_player)
    @game_player = game_player
    @game = @game_player.game
    mail to: game_player.player.email, subject: 'Invite'
  end

  def generic_email(game_player, text, include_game_info, include_signup_links)
    @text = text
    @game_player = game_player
    @game = @game_player.game
    @include_game_info = include_game_info
    @include_signup_links = include_signup_links
    subject = "Football #{@game.location} #{@game.time.strftime("%H:%M") +' '+ @game.date.to_s}"
    mail to: game_player.player.email, subject: subject
  end
end
