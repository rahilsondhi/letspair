require 'spec_helper'

describe Topic do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_uniqueness_of(:github_id) }

  it { should have_and_belong_to_many(:users) }
  it { should have_and_belong_to_many(:sessions) }
  it { should have_and_belong_to_many(:needs) }
end
