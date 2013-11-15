class GamesController < InheritedResources::Base

  def addplayer(input)

    if @players.include?(input)

      @game.players << players.(input)
    else
      g = player.create(:name => input)
      @game.players << g
    end
  end
end
