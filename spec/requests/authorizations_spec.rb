require 'spec_helper'

describe "Authorizations" do

  before do
    @event = Factory(:event, :id => 1, :fid => 1)
    #visit root_path
    #page.should have_selector '#login' #user logged out
  end

  it "start import requires login" do
    visit start_events_import_path
    page.should have_content i18n('errors.messages.not_logged_in')
  end

  specify "import event requires login" do
    visit import_event_path(1)
    page.should have_content i18n('errors.messages.not_logged_in')
  end

end
