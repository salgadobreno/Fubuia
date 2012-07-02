require 'spec_helper'

describe "Authentications" do

  before do
    Koala::Facebook::API.any_instance.stubs(:fql_query).returns({})
  end

  context "Logged out" do

    it "should display login button" do
      visit '/'
      page.should have_selector '#login'
    end

  end

  #context "Facebook Connect", :js => true do
  #  specify "Clicking on login button will open Facebook-Connect pop up" do
  #    visit '/'
  #    click_on 'login'
  #    within_window(page.driver.browser.window_handles.last) do
  #      page.current_url.should match "facebook.com"
  #    end
  #  end
  #end

  context "Logging" do

    context "if user has allowed access to app" do

      before do
        me = {'id' => '1','email' => 'eu@eu.com','name' => 'Breno Salgado'}
        Koala::Facebook::API.any_instance.stubs(:get_object).with("me").returns(me)
        Koala::Facebook::API.any_instance.stubs(:fql_query).returns([])
      end

      it "redirects to root with the user signed in" do
        visit login_path(:code => "1234")
        page.should have_content i18n('messages.login_success')
      end
    end

    #TODO
    context "user has not allowed access to app" do
      it "redirects to root with an error message" do
        visit login_path
        page.should have_content "Missing AccessToken"
      end
    end

    context "Logged in" do

      before(:each) do
        me = {'id' => '1','email' => 'eu@eu.com','name' => 'Breno Salgado'}
        Koala::Facebook::API.any_instance.stubs(:get_object).with("me").returns(me)
        Koala::Facebook::API.any_instance.stubs(:fql_query).returns([])
        page.driver.get login_path(:code => "1234")
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
