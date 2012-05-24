# encoding: utf-8
require 'spec_helper'

describe "Home" do

  before do
    @event = create(:event, :fid => 12345678, :active => true, :start_at => Date.today, :end_at => Date.today)
    @event2 = create(:event, :fid => 666, :active => false, :start_at => Date.today, :end_at => Date.today)
    @facebook_events = [{"name"=>"Evento 1", "eid"=>12345678}, {"name" => "Evento 2", "eid" => 666}]
    Koala::Facebook::API.any_instance.stubs(:fql_query).returns(@facebook_events)
  end

  describe "menus" do
    it "should have menu 'contato'" do
      visit '/'
      page.should have_selector "#contato"
    end

    describe "como funciona" do
      it "should have menu 'como funciona'" do
        visit '/'
        page.should have_selector "#como-funciona-link"
      end

      specify "it points to 'como funciona' section" do
        visit '/'
        page.find_link("como-funciona-link")["href"].should match /#como-funciona/
      end
    end
  end

  it "should display city name" do
    visit '/'
    page.should have_content "Brasília"
  end

  it "should display todays date" do
    Date.stubs(:today).returns(Date.civil(2011, 1, 1))
    visit '/'
    page.should have_content "1 de Janeiro, 2011"
  end

  it "should display the weekly calendar" do
    visit '/'
    page.should have_selector '.ec-calendar'
    ['Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb', 'Dom'].each do |day|
      page.should have_content day
    end
  end

  it "should display new event button" do
    visit '/'
    page.should have_content i18n 'pages.events.new'
    page.find_link(i18n('pages.events.new'))["href"].should == new_event_path
  end

  context "when there's events" do

    specify "active events should appear on the calendar" do
      visit '/'
      page.find('.ec-calendar').should have_content 'Evento 1'
    end

    specify "non active events should not appear on the calendar" do
      visit '/'
      page.find('.ec-calendar').should_not have_content 'Evento 2'
    end

    context "when event's have tags" do
      before do
        @event.tag_list = '1,2'
        @event2.tag_list = '3'
        @event2.active = true
        @event.save
        @event2.save
      end

      it "should display tags from the events" do
        visit '/'
        page.should have_link '1'
        page.should have_link '2'
        page.should have_link '3'
      end

      context "clicking on a tag" do

        before do
          visit '/'
          page.should have_content "Evento 2"
        end

        it "should filter events through that tag" do
          click_on '1'
          page.should_not have_content "Evento 2"
          page.should have_content i18n('pages.tags.filtering', :tag => '1')
          page.should have_link 'limpar'
        end

        specify "clicking on 'limpar' should get back at the original state" do
          click_on '1'
          page.should_not have_content "Evento 2"
          click_link 'limpar'
          page.should have_content "Evento 2"
        end

      end
    end

  end
end
