class Group < ActiveRecord::Base
  attr_accessible :name, :user_id

  belongs_to :user
  has_and_belongs_to_many :players, uniq: true

  validates :name, presence: true
end