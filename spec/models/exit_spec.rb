require 'spec_helper'

describe Exit do
  it { should belong_to(:room) }
  it { should belong_to(:destination).class_name('Room') }
end
