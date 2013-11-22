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

  def add_from_group
    if params[:group][:group_id].present?
      game = Game.find params[:id]
      group = current_user.groups.find params[:group][:group_id]
      # Prevent duplicates
      group.players.each do |player|
        game.game_players.create player: player unless game.game_players.exists?(player_id: player.id)
      end
    end
    redirect_to game, notice: 'Players were successfully added from group'
  end

  def email_form
    @game = Game.find params[:id]
    @invite_email = InviteEmail.new game: @game
  end

  def send_emails
    @game = Game.find params[:id]
    @invite_email = InviteEmail.new params[:invite_email].merge(game: @game)
    @invite_email.save
  end

end