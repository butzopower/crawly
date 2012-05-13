require 'spec_helper'

describe PickUp do
  describe '#new' do
    it 'should take a hash of attributes' do
      pick_up = PickUp.new(room: :foo, item: :bar, user: :baz)
      pick_up.room.should == :foo
      pick_up.item.should == :bar
      pick_up.user.should == :baz
    end
  end

  describe "#valid?" do
    let(:room) { create(:room) }
    let(:item) { create(:item, room: room) }
    let(:user) { create(:user) }

    context 'item is not in room' do
      it 'should be false' do
        item.room = nil
        item.save

        pickup = PickUp.new(room: room, item: item, user: user)
        pickup.should_not be_valid
      end
    end

    it 'should be true otherwise' do
      pickup = PickUp.new(room: room, item: item, user: user)
      pickup.should be_valid
    end
  end

  describe '#execute' do
    let(:room) { create(:room) }
    let(:item) { create(:item, room: room) }
    let(:user) { create(:user) }
    let(:pickup) { PickUp.new(room: room, item: item, user: user) }

    context 'pick up is valid' do
      it 'should move the item from room to user' do
        pickup.stub(:valid?).and_return(true)
        pickup.execute
        item.reload

        item.user.should == user
        item.room.should == nil
      end
    end

    context 'pick up is invalid' do
      it 'should not move the item' do
        pickup.stub(:valid?).and_return(false)
        pickup.execute
        item.reload

        item.user.should == nil
        item.room.should == room
      end
    end
  end
end