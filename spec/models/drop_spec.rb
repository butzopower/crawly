require 'spec_helper'

describe Drop do
  describe '#new' do
    it 'should take a hash of attributes' do
      drop = Drop.new(room: :foo, item: :bar, user: :baz)
      drop.room.should == :foo
      drop.item.should == :bar
      drop.user.should == :baz
    end
  end

  describe "#valid?" do
    let(:room) { create(:room) }
    let(:item) { create(:item, user: user) }
    let(:user) { create(:user) }

    context 'user does not have item' do
      it 'should be false' do
        item.user = nil
        item.save

        drop = Drop.new(room: room, item: item, user: user)
        drop.should_not be_valid
      end
    end

    it 'should be true otherwise' do
      drop = Drop.new(room: room, item: item, user: user)
      drop.should be_valid
    end
  end


  describe '#execute' do
    let(:room) { create(:room) }
    let(:item) { create(:item, user: user) }
    let(:user) { create(:user) }
    let(:drop) { Drop.new(room: room, item: item, user: user) }

    context 'drop is valid' do
      it 'should move the item from user to room' do
        drop.stub(:valid?).and_return(true)
        drop.execute
        item.reload

        item.user.should == nil
        item.room.should == room
      end
    end

    context 'drop is invalid' do
      it 'should not move the item' do
        drop.stub(:valid?).and_return(false)
        drop.execute
        item.reload

        item.user.should == user
        item.room.should == nil
      end
    end
  end
end