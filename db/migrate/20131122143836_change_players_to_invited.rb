class ChangePlayersToInvited < ActiveRecord::Migration
  def up
    GamePlayer.where(status: :players).update_all status: :invited
  end

  def down
    GamePlayer.where(status: :invited).update_all status: :players
  end
end
