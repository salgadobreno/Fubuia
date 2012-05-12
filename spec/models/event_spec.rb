require 'spec_helper'

describe Event do
  before(:each) do
    @event = Factory.build(:event)
  end

  it "has an facebook event id" do
    @event.should respond_to(:fid)
  end

  it "has start time" do
    @event.should respond_to(:start_at)
  end

  it "has end time" do
    @event.should respond_to(:end_at)
  end

  it "has event calendar" do
    Event.included_modules.should include(EventCalendar::InstanceMethods)
  end

  it "belongs to an user" do
    @event.should respond_to(:user)
  end

  it "belongs to a city" do
    @event.should respond_to(:city)
  end

  context "validations" do

    it "requires a city" do
      @event.city = nil
      @event.should_not be_valid
      @event.errors[:city].should include(i18n 'errors.messages.blank')
    end

    it "requires an event facebook id" do
      @event.fid = nil
      @event.should_not be_valid
      @event.errors[:fid].should include(i18n 'errors.messages.blank')
    end

    it "requires a start day" do
      @event.start_at = nil
      @event.should_not be_valid
      @event.errors[:start_at].should include(i18n 'errors.messages.blank')
    end

    it "validates that start day is not greater than end day" do
      @event.start_at = Date.today
      @event.end_at = Date.today - 1
      @event.should_not be_valid
      @event.errors[:end_at].should include(i18n 'errors.messages.event.end_before_start')
    end

    it "defaults end date day to start day, if none given" do
      @event.start_at = DateTime.civil(2011, 1 ,1)
      @event.end_at = nil
      @event.save.should be_true
      @event.end_at.should == DateTime.civil(2011, 1, 1)
    end

  end

  context "given it receives valid attributes" do

    it "should save successfully" do
      @event.save.should == true
    end

  end

  context "tags" do
    before do
      Factory(:event, :fid => '41', :tag_list => "first, 2, four, three, rock, last")
    end

    specify "should retain inserted order" do
      Event.find_by_fid(41).tag_list.should == ["first", "2", "four", "three", "rock", "last"]
    end

  end

end
