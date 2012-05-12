require 'spec_helper'

describe Tag do
  before(:each) do
    @tag = Tag.new
  end

  it "has Parent Tag" do
    @tag.should respond_to(:parent)
  end

  context "validations" do

    it "validates presence of name" do
      tag = Tag.new
      tag.should_not be_valid
      tag.errors[:name].should include(i18n('errors.messages.blank'))
    end

  end

  describe "#css_class" do
    context ":CSS => true" do

      it "returns the tag name downcased, without spaces" do
        t = Tag.new(:name => "mIMi tuTu", :css => true)
        t.css_class.should == "mimi-tutu"
      end

    end

    context ":CSS => false" do

      specify "returns nil if no parent" do
        Tag.new(:name => "naorock", :css => false).css_class.should be_nil
      end

      specify "returns parent's #css_class if parent" do
        parent = Factory(:tag, :css => true, :name => "rock")
        child = Factory(:tag, :css => false, :parent => parent)
        child.css_class.should == "rock"
      end

    end

    it "returns the parent tag css_class if 'css' if false" do
      parent = Factory(:tag, :name => "Rock")
      child = Factory(:tag, :name => "Stoner Rock")
    end

  end

  describe ".event_tags_for_date_range scope" do
    it "should find any tags in events overlaping the range" do
      @event = Factory(:event, :tag_list => "1, 2, in", :start_at => Date.today, :end_at => Date.today + 1)
      @event2 = Factory(:event, :tag_list => "out", :start_at => Date.today, :end_at => Date.today)
      @tags = Tag.event_tags_for_date_range(Date.today + 1, Date.today + 3)
      @tags.should include(Tag.find_by_name("in"))
      @tags.should_not include(Tag.find_by_name("out"))
    end
  end

  describe ".tag_counts_for_date_range" do

    it "should find any tags in events overlaping the range" do
      @event = Factory(:event, :tag_list => "1, 2, in", :start_at => Date.today, :end_at => Date.today + 1)
      @event2 = Factory(:event, :tag_list => "out", :start_at => Date.today, :end_at => Date.today)
      @tag_counts = Tag.tag_counts_for_date_range("tags", Date.today + 1, Date.today + 3)
      @tag_counts.should include(Tag.find_by_name("in"))
      @tag_counts.should_not include(Tag.find_by_name("out"))
    end

    context "given there's 3 events today, one with '1' tag, two with '2' tag, three with '3' tag, plus one event tomorrow with tag 3 and one event yesterday with tag 1 and I ask for the tags and counts for TODAY" do

      before do
        @event = Factory(:event, :tag_list => "1, 2, 3", :start_at => Date.today)
        @event2 = Factory(:event, :tag_list => "2, 3", :start_at => Date.today)
        @event3 = Factory(:event, :tag_list => "3", :start_at => Date.today)
        @event4 = Factory(:event, :tag_list => "1", :start_at => Date.today - 1)
        @event5 = Factory(:event, :tag_list => "3", :start_at => (Date.today + 1))
        @tag_counts = Tag.tag_counts_for_date_range("tags", Date.today, Date.today)
      end
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
