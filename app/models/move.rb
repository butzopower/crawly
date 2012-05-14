class Move
  attr_accessor :room, :exit, :user

  def initialize(options={})
    self.room = options[:room]
    self.exit = options[:exit]
    self.user = options[:user]
  end

  def valid?
    user.room == room && exit.room == room
  end

  def execute
    return unless valid?

    user.room = exit.destination
    user.save
  end
end