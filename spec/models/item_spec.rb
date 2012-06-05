require 'spec_helper'

describe Item do
  it { should belong_to :room }
  it { should belong_to :user }

  describe 'on update' do
    context 'room is set' do
      it 'should unset the user' do
        item = create(:item, user: create(:user))
        item.room = create(:room)
        item.save
        item.reload.user.should be_nil
      end
    end
  end
end