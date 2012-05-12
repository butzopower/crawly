class Item < ActiveRecord::Base
  attr_accessible :name
  belongs_to :room
end