require 'spec_helper'

describe Topic do
  it { should validate_presence_of(:name) }
  it { should ensure_length_of(:name).is_at_most(255) }

  it { should have_and_belong_to_many(:users) }
  it { should have_and_belong_to_many(:sessions) }
  it { should have_and_belong_to_many(:needs) }
end
