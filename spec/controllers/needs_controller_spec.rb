require 'spec_helper'

describe NeedsController do

  describe 'POST #create' do
    context 'when the user is not logged in' do
      it {
        expect { xhr :post, :create }.to raise_error Pair::NotLoggedIn
      }
    end

    context 'when the user is logged in' do
      let!(:user) { log_in }
      let(:need) { Fabricate.build(:need) }

      it {
        Need.any_instance.expects(:save).returns(need)
        xhr :post, :create, Fabricate.attributes_for(:need)
        should respond_with :created
      }

      it {
        Need.any_instance.expects(:save).returns(need)
        xhr :post, :create, Fabricate.attributes_for(:need)
        should render_template :create
      }
    end
  end

end
