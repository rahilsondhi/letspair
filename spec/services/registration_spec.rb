require 'spec_helper'

describe Registration do

  describe '.new_account' do
    subject { Registration.new_account(attrs) }

    context 'when attrs is empty' do
      let(:attrs) { {} }
      it {
        expect { subject }.to_not change(User, :count)
      }
    end

    context 'when attrs is complete' do
      let(:attrs) {
        {
          email: Faker::Internet.email,
          username: Faker::Internet.user_name,
          name: Faker::Name.name,
          location: Faker::Address.city,
          dp: Faker::Internet.url,
          provider: 'github',
          topic_ids: topic_ids,
          uid: '123',
          token: '123',
          oauth_username: Faker::Internet.user_name
        }
      }

      let(:topic_ids) {
        topics = 3.times { Fabricate :topic }
        Topic.all.map &:id
      }

      it {
        should be_a User
      }
    end
  end

end
