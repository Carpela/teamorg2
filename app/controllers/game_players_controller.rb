class GamePlayersController < ApplicationController
  def change_status
    return unless %w(available unavailable selected).include?(params[:status])
    @gameplayer = GamePlayer.find(params[:game_player_id])
    @gameplayer.update_attributes status: params[:status]
    redirect_to game_path(@gameplayer.game), notice: @gameplayer.player.name + ' is ' + params[:status]
  end
end