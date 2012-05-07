class Room < ActiveRecord::Base
  attr_accessible :name, :description

  has_many :exits
end
