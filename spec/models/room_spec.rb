require 'spec_helper'

describe Room do
  it { should have_many :exits }
  it { should accept_nested_attributes_for(:exits).allow_destroy(true) }
  it 'should not allow blank exits' do
    subject.exits_attributes = [{name: '', destination_id: ''}]
    subject.save
    subject.exits.should be_empty
  end
end
