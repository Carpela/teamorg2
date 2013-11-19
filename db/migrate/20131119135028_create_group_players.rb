class CreateGroupPlayers < ActiveRecord::Migration
  def change
    create_table :groups_players, id: false do |t|
      t.integer :group_id
      t.integer :player_id
    end
    add_index :groups_players, [:group_id, :player_id]
  end
end