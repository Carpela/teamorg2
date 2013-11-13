class AddSidesToGame < ActiveRecord::Migration
  def change
    add_column :games, :sides, :integer
  end
end
