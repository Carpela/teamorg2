class GamePlayersController < ApplicationController
  def change_status
    return unless %w(available unavailable).include?(params[:status])
    GamePlayer.find(params[:game_player_id]).update_attributes status: params[:status]
  end
end