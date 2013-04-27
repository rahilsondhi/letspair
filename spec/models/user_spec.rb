require 'spec_helper'

describe User do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:timezone) }

  it { should have_many(:credentials) }
  it { should have_many(:authored_messages).class_name('Message') }
  it { should have_many(:recipient_messages).class_name('Message') }
  it { should have_many(:sessions) }
  it { should have_many(:partnered_sessions).class_name('Session') }
  it { should have_many(:needs) }
  it { should have_and_belong_to_many(:topics) }
end
