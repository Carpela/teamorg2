class PlayersController < InheritedResources::Base
  before_filter :set_game
  respond_to :js, only: :new

  def create
    @player = @game.players.build params[:player]
    if @player.valid?
      @gameplayer = @game.game_players.create player: @player
      respond_to do |f|
        f.html { redirect_to @game }
        f.js
      end
    else
      render :new
    end
  end

  def gmail

  end

  private

  def set_game
    @game = Game.find params[:game_id] if params[:game_id].present?
  end
end