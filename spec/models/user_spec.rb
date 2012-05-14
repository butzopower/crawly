require 'spec_helper'

describe User do
  it { should have_many :items }
  it { should belong_to :room }
end
