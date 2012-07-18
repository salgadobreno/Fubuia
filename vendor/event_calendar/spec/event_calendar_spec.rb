require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "event calendars" do
  before(:each) do
    @time = DateTime.new
  end

  context "setup" do
    it "should find the event model" do
      time  = DateTime.now
      event = Event.new
      event.start_at = time
      event.end_at   = time
      event.start_at.should eql( time )
      event.end_at.should eql( time )
    end

    it "should load plugin" do
      lambda { Event.has_event_calendar }.should_not raise_error
    end

    it "should use start_at for default field" do
      Event.start_at_field.should eql('start_at')
    end

    it "should use end_at for default field" do
      Event.end_at_field.should eql('end_at')
    end
  end

  context "not overriding fields" do
    it "should not alias the start_at method" do
      event = Event.new
      event.start_at = @time
      event.start_at.should eql( @time )
    end
    it "should not alias the end_at method" do
      event = Event.new
      event.end_at = @time
      event.end_at.should eql( @time )
    end
    context "generating database queries" do
      it "should rely on the standard fields" do
        yesterday = DateTime.now - 1.day
        tomorrow  = DateTime.now + 1.day
        event = Event.create(:start_at => yesterday, :end_at => tomorrow)
        Event.events_for_date_range((Date.today - 1.week ), (Date.today + 1.week)).should eql(
          [ event ]
        )
      end
    end
  end

  context "overriding fields" do
    it "should alias the start_at method" do
      event = CustomEvent.new
      event.custom_start_at = @time
      event.custom_start_at.should eql( @time )
      event.start_at.should eql( @time )
    end
    it "should alias the end_at method" do
      event = CustomEvent.new
      event.custom_end_at = @time
      event.custom_end_at.should eql( @time )
      event.end_at.should eql( @time )
    end
    context "generating database queries" do
      it "should rely on the overridden fields" do
        yesterday = DateTime.now - 1.day
        tomorrow  = DateTime.now + 1.day
        event = CustomEvent.create(:custom_start_at => yesterday, :custom_end_at => tomorrow)
        CustomEvent.events_for_date_range((Date.today - 1.week ), (Date.today + 1.week)).should eql(
          [ event ]
        )
      end
    end
  end

  describe "Class methods" do

    describe ".create_event_strips" do
      context "given I tell it to create strips for this week" do
        it "returns an array with 8 spaces" do
          comparison = [[nil, nil, nil, nil, nil, nil, nil, nil]]
          Event.create_event_strips(Date.today - 3, Date.today + 4, []).should == comparison
        end
      end
    end

    describe ".event_strips_for_week" do
      before(:each) do
        Event.destroy_all
        @mon = DateTime.civil(87,12,03)
        @thu = @mon + 3
        @sun = @thu + 3
        @mon.wday.should == 1
        @thu.wday.should == 4
        @sun.wday.should == 0
        @first = Event.create(:start_at => @mon, :end_at => @mon)
        @second = Event.create(:start_at => @thu, :end_at => @thu)
        @third = Event.create(:start_at => @sun, :end_at => @sun)
        Date.stub(:today).and_return(@thu)
        Date.today.should == @thu
      end

      it "accepts a parameterless call" do
        lambda { Event.event_strips_for_week }.should_not raise_error
      end

      context "given there's three events, one on Mon, one on Thu, one in Sun and the first day of the week is Mon" do
        it "returns an array with the three events in it" do
          comparison = [[@first, nil, nil, @second, nil, nil, @third, nil]]
          Event.event_strips_for_week.should == comparison
        end
      end
    end



  end
end
