require 'spec_helper'
require 'autoimporters'

describe "Auto Importers" do
  describe "FubuiaImporter" do
    before do
      #TODO
      #@already_had = {}
      date_today = Date.civil(2012, 10, 1)
      datetime_today = DateTime.civil(2012,10,1)
      time_today = datetime_today.to_time

      Date.stubs(:today).returns(date_today)
      DateTime.stubs(:now).returns(datetime_today)
      Time.stubs(:now).returns(time_today)

      @bcount = Event.count
      @fb_hash = fubevents()

      #stubs
      user = FactoryGirl.create(:user, :email => "fubuia@fubuia.com.br")
      Koala::Facebook::API.any_instance.stubs(:fql_query).returns(@fb_hash)

      AutoImporters::FubuiaImporter.run
    end

    it "should save all new events from Fubuia's profile" do
      Event.count.should == (@bcount + 5)

      fids = Event.all.map(&:fid)
      [11,22,33,44,55].each {|x| fids.should include x}
    end
  end
end
