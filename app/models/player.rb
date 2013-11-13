class Player < ActiveRecord::Base
  attr_accessible :email, :name, :phone
  belongs_to :team
  has_and_belongs_to_many :games
end
