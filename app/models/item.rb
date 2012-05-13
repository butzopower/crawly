class Item < ActiveRecord::Base
  attr_accessible :name
  belongs_to :room
  belongs_to :user
end