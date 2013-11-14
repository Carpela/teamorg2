class Game < ActiveRecord::Base
  attr_accessible :date, :location, :time, :format, :sides
  has_many :players
  belongs_to :user
  attr_accessor :player_list
  # after_save :update_players
end
