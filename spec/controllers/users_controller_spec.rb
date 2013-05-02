require 'spec_helper'

describe UsersController do

  describe 'POST #create' do
    context 'when Registration.new_account passes' do
      before do
        xhr :post, :create, Fabricate.attributes_for(:user)
      end

      it {
        pending
        should render_template :show
      }

      it {
        pending
        should respond_with :created
      }

      it {
        pending
        session[:pending_user].should be_nil
      }

      it {
        pending
        session[:user_id].should be_a Integer
      }
    end

    context 'when Registration.new_account fails' do
      before do
        xhr :post, :create, nil
      end

      it {
        should respond_with :unprocessable_entity
      }
    end

  end

end
