require 'spec_helper'

describe Need do
  it { should validate_presence_of(:date_type) }
  it { should ensure_inclusion_of(:date_type).in_array(Need::VALID_DATE_TYPES) }
  it { should validate_presence_of(:description) }

  it { should have_many(:sessions) }
  it { should belong_to(:user) }
  it { should have_and_belong_to_many(:topics) }
end
