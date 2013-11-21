class GroupsController < InheritedResources::Base

  def show
    show! do
      @player = @group.players.build
    end
  end

  def add_player
    @group = current_user.groups.find params[:id]
    @player = Player.new params[:player]
    if @player.save
      @group.players << @player
      redirect_to @group
    else
      render :show
    end
  end

  protected

  def begin_of_association_chain
    current_user
  end
end