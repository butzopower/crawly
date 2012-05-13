class Item < ActiveRecord::Base
  attr_accessible :name, :room_id
  belongs_to :room
  belongs_to :user
end