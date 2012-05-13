class PickUp
  attr_accessor :room, :item, :user
  def initialize(options={})
    self.room = options[:room]
    self.item = options[:item]
    self.user = options[:user]
  end

  def valid?
    room.items.include?(item)
  end

  def execute
    return unless valid?

    item.user = user
    item.room = nil
    item.save
  end
end