class CreateSides < ActiveRecord::Migration
  def change
    create_table :sides do |t|
      t.integer :game_id
      t.string :shirt_colour

      t.timestamps
    end
  end
end
