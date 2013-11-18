class GamesController < InheritedResources::Base
  def new
    @game = Game.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @game }
    end
  end
  def create
    @game = Game.new(params[:game])

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'game was successfully created.' }
        format.json { render json: @game, status: :created, location: @game }
      else
        format.html { render action: "new" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  def send_invites
    @game = Game.find params[:id]
    @game.game_players.players.each do |game_player|
      PlayersMailer.invites(game_player).deliver
    end
    redirect_to game_path(@game), notice: 'Invites were sent'
  end
end
