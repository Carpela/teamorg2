class Team < ActiveRecord::Base
  attr_accessible :name, :user_id
  has_many :players, :games
  belongs_to :user
end
