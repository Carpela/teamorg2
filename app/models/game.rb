class Game < ActiveRecord::Base
  attr_accessible :date, :location, :time
  has_many :players
  belongs_to :user
  attr_accessor :player_list
  # after_save :update_players
end
