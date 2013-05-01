require 'spec_helper'

describe Message do
  it { should validate_presence_of(:body) }

  it { should belong_to(:author).class_name('User') }
  it { should belong_to(:recipient).class_name('User') }
  it { should belong_to(:session) }
end
