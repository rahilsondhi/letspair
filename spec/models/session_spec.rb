require 'spec_helper'

describe Session do
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:partner_id) }
  it { should validate_presence_of(:state) }
  it { should ensure_inclusion_of(:state).in_array(Session::VALID_STATES) }

  it { should belong_to(:user) }
  it { should belong_to(:partner).class_name('User') }
  it { should belong_to(:need) }
  it { should belong_to(:waiting_for).class_name('User') }
  it { should have_many(:messages) }
  it { should have_and_belong_to_many(:topics) }
end
