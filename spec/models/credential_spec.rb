require 'spec_helper'

describe Credential do
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:provider) }
  it { should validate_presence_of(:uid) }

  it { should belong_to(:user) }
end
