class Item < ActiveRecord::Base
  attr_accessible :name, :room_id
  belongs_to :room
  belongs_to :user

  before_update :unset_user_if_room_changed

  protected

  def unset_user_if_room_changed
    if room.present? && self.user.present?
      self.user = nil
    end
  end
end