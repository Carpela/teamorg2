class GroupsController < InheritedResources::Base

  def show
    show! do
      @player = @group.players.build
    end
  end

  def add_player
    @group = Group.find params[:id]
    @player = Player.new params[:player]
    if @player.save
      @group.players << @player
      redirect_to @group
    else
      render :show
    end
  end

end