require 'spec_helper'

describe Registration do

  describe '.new_account' do
    subject { Registration.new_account(attrs) }

    context 'when attrs is empty' do
      let(:attrs) { {} }
      it {
        expect { subject }.not_to_change(User, :count)
      }
    end

    context 'when attrs is complete', :focus do
      let(:attrs) {
        {
          email: Faker::Internet.email,
          username: Faker::Internet.user_name,
          name: Faker::Name.name,
          location: Faker::Address.city,
          dp: Faker::Internet.url,
          provider: 'github',
          uid: '123',
          token: '123',
          oauth_username: Faker::Internet.user_name
        }
      }

      it {
        should be_a User
      }
    end
  end

end
