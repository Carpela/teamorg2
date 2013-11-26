class AddFormatToGame < ActiveRecord::Migration
  def change
    add_column :games, :format, :integer
  end
end
