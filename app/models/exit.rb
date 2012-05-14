class Exit < ActiveRecord::Base
  attr_accessible :destination_id, :name, :room_id

  belongs_to :room
  belongs_to :destination, class_name: 'Room'
end
