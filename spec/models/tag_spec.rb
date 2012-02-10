require 'spec_helper'

describe Tag do
  before(:each) do
    @tag = Tag.new
  end

  it "has events" do
    @tag.should respond_to(:events)
  end

  describe ".tag_counts_for_date_range" do
    before(:each) do
      @event = Factory(:event, :tag_list => "1, 2, 3")
      @event2 = Factory(:event, :tag_list => "2, 3")
      @event3 = Factory(:event, :tag_list => "3")
      @event4 = Factory(:event, :tag_list => "1", :start_at => Date.today - 1)
      @event5 = Factory(:event, :tag_list => "3", :start_at => (Date.today + 1))
      @tag_counts = Tag.tag_counts_for_date_range("tags", Date.today, Date.today)
    end
    context "given there's 3 events today, one with '1' tag, two with '2' tag, three with '3' tag, plus one event tomorrow with tag 3 and one event yesterday with tag 1 and I ask for the tags and counts for TODAY" do
      it "returns an array with 3 tags" do
        @tag_counts.size.should == 3
      end
      it "tag 1 should have 1 as count" do
        @tag_counts[0].count.should == 1
      end
      it "tag 2 should have 2 as count" do
        @tag_counts[1].count.should == 2
      end
      it "tag 3 should have 3 as count" do
        @tag_counts[2].count.should == 3
      end
    end
  end
end
