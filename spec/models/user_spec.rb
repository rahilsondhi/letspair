require 'spec_helper'

describe User do
  it { should validate_presence_of(:email) }
  it { should allow_value('john@gmail.com').for(:email) }
  it { should_not allow_value('asdf', 'asdggmail.com', '@gmail.com').for(:email) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:name) }
  it { should ensure_length_of(:name).is_at_most(255) }

  describe 'username validations' do
    subject { Fabricate.build(:user) }
    it { should allow_value('johndoe', '1johndoe', '1john_doe').for(:username) }
    it { should_not allow_value('!@##$%', '_johndoe', 'johndoe_').for(:username) }
  end

  it { should have_many(:credentials) }
  it { should have_many(:authored_messages).class_name('Message') }
  it { should have_many(:recipient_messages).class_name('Message') }
  it { should have_many(:sessions) }
  it { should have_many(:partnered_sessions).class_name('Session') }
  it { should have_many(:needs) }
  it { should have_and_belong_to_many(:topics) }
end
