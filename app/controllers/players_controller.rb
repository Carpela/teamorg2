class PlayersController < InheritedResources::Base
  before_filter :set_game

  def create
    @player = @game.players.build params[:player]
    if @player.valid?
      @game.game_players.create player: @player
      redirect_to @game
    else
      render :new
    end
  end

  private

  def set_game
    @game = Game.find params[:game_id] if params[:game_id].present?
  end
end