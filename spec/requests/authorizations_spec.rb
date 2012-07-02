require 'spec_helper'

describe "Authorizations" do

  before do
    Koala::Facebook::API.any_instance.stubs(:fql_query).returns({})
    @event = create(:event, :id => 1, :fid => 1)
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
