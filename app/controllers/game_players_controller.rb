class GamePlayersController < ApplicationController
  def change_status
    return unless %w(available unavailable selected).include?(params[:status])
    @gameplayer = GamePlayer.find(params[:game_player_id])
    @gameplayer.update_attributes status: params[:status]
    
    if @gameplayer.status_was =='available' || 'selected'
      if params[:status] == 'unavailable'
        AlertMailer.dropout_notification(@gameplayer.player).deliver
      end
    end
    redirect_to game_path(@gameplayer.game), notice: @gameplayer.player.name + ' is ' + params[:status]
  end

  def destroy
    @gameplayer = GamePlayer.find(params[:id])
    @game = @gameplayer.game
    @gameplayer.destroy
    respond_to do |format|
      format.html { redirect_to game_path(@game), notice: 'Player removed' }
      format.json { head :no_content }
    end
  end


end