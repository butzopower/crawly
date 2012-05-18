class Drop
  attr_accessor :room, :item, :user
  def initialize(options={})
    self.room = options[:room]
    self.item = options[:item]
    self.user = options[:user]
  end

  def valid?
    user.items.include?(item)
  end

  def execute
    return unless valid?

    item.user = nil
    item.room = room
    item.save
  end
end