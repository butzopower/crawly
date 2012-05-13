require 'spec_helper'

describe Item do
  it { should belong_to :room }
  it { should belong_to :user }
end