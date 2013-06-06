class Player < ActiveRecord::Base
  attr_accessible :email, :name, :phone
  has_and_belongs_to_many :games
end
