class GamesController < InheritedResources::Base
  def send_invites
    @game = Game.find params[:id]
    @game.game_players.players.each do |game_player|
      PlayersMailer.invites(game_player).deliver
    end
    redirect_to game_path(@game), notice: 'Invites were sent'
  end
end
