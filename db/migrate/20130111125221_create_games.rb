class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :location
      t.time :time
      t.date :date

      t.timestamps
    end
  end
end
