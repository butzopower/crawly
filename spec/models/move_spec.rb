require 'spec_helper'

describe Move do
  describe '#new' do
    it 'should take a hash of attributes' do
      move = Move.new(room: :foo, exit: :bar, user: :baz)
      move.room.should == :foo
      move.exit.should == :bar
      move.user.should == :baz
    end
  end

  describe "#valid?" do
    let(:room) { create(:room) }
    let(:room2) { create(:room) }
    let(:exit) { create(:exit, room: room, destination: room2) }
    let(:user) { create(:user, room: room) }
    let(:move) { Move.new(room: room, exit: exit, user: user) }

    it 'should be false if user is not in the room' do
      user.room = room2
      user.save

      move.should_not be_valid
    end

    it 'should be false if the exit does not belong to the room' do
      exit.room = room2
      exit.save

      move.should_not be_valid
    end

    it 'should be true otherwise' do
      move.should be_valid
    end
  end

  describe '#execute' do
    let(:room) { create(:room) }
    let(:room2) { create(:room) }
    let(:exit) { create(:exit, room: room, destination: room2) }
    let(:user) { create(:user, room: room) }
    let(:move) { Move.new(room: room, exit: exit, user: user) }

    context 'move is valid' do
      it 'should move the user from room1 to room2' do
        move.stub(:valid?).and_return(true)
        expect do
          move.execute
        end.to change { user.reload.room }.from(room).to(room2)
      end
    end

    context 'move is invalid' do
      it 'should not move the item' do
        move.stub(:valid?).and_return(false)

        expect do
          move.execute
        end.to_not change { user.reload.room }
      end
    end
  end
end