require 'spec_helper'

describe "Authentications" do

  before do
    Koala::Facebook::API.any_instance.stubs(:fql_query).returns({})
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      :provider => 'facebook',
      :uid => '1234567',
      :info => {
        :email => 'salgado@breno.com',
        :name => 'Breno Salgado',
      },
      :credentials => {
        :token => 'ABCDEF...',
        :expires_at => 1321747205,
        :expires => true
      }
    })
  end

  context "Logged out" do

    it "should display login button" do
      visit '/'
      page.should have_selector '#login'
    end

  end

  context "Logging in" do

    context "if user has allowed access to app" do

      it "redirects to root with the user signed in" do
        visit login_path
        page.should have_content i18n('messages.login_success')
      end
    end

    context "Logged in" do

      before(:each) do
        visit login_path
      end

      specify "page should display the users name" do
        visit '/'
        page.should have_content "Breno Salgado"
      end

      specify "page should display a logout link" do
        visit '/'
        page.should have_selector "#logout"
      end

      context "Logging out" do

        specify "clicking on logout should log the user out" do
          visit '/'
          click_on 'logout'
          page.should have_selector "#login"
          page.should have_content i18n('messages.logout_success')
        end

      end

    end

  end

end
