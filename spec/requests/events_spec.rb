#coding: UTF-8
require 'spec_helper'

describe "Events" do
  before do
    @event = create(:event, :fid => 12345678, :active => true, :start_at => Date.today, :end_at => Date.today)
    @event2 = create(:event, :fid => 666, :active => false, :start_at => Date.today, :end_at => Date.today)
    @facebook_events = [{"name"=>"Evento 1", "eid"=>12345678}, {"name" => "Evento 2", "eid" => 666}]
    Koala::Facebook::API.any_instance.stubs(:fql_query).returns(@facebook_events)
  end

  describe "show" do
    before do
      @event_db = create(:event, :fid => 12345, :tag_list => "rock, 0800 beer" )
      @multiquery = multiquery()
      Koala::Facebook::API.any_instance.stubs(:fql_multiquery).returns(@multiquery)
      @event = @multiquery["event"][0]
      @creator = @multiquery["creator"][0]
    end

    it "should display the event info from facebook" do
      visit event_path(@event_db)
      page.should have_content "Breno Salgado" #creator
      page.should have_content "No mundo inteiro" #location
      page.should have_content "Fim do Mundo - Eu vou!" #name
      page.should have_content "rock" #tags
      page.should have_content "0800" #tags
      page.should have_content "beer" #tags
      page.should have_content "OpenBar até o último cliente" #description
      page.find('img', :src => "http://profile.ak.fbcdn.net/hprofile-ak-snc4/50236_105417699523664_1798087_n.jpg").should_not be_nil
    end

  end

  describe "new" do

    it "requires log in" do
      visit new_event_path
      page.should have_content page.should have_content i18n('errors.messages.not_logged_in')
    end

    context "user logged in" do
      before do
        visit '/'
        page.find_link('Login')["href"].should =~ /first.log.in/
      end

      context "first visit" do
        pending
      end

      it "displays user's events from facebook" do
        visit new_event_path
        p
      end
    end

    context "clicking on 'start' link" do

      context "user logged in" do
        before do
          connections_hash = [{"name"=>"Fim do Mundo - Eu vou!", "id"=>"105417699523664"}, {"name"=>"CAMPANHA: CID, DOE SEU SALÁRIO!", "id"=>"226420880736785"}, {"name"=>"LONDON CALLING Summer Edition**show com JOHNNY FLIRT e CASSINO SUPERNOVA",  "id"=>"317163524988819"}, {"name"=>"teste", "id"=>"372742442742194"}, {"name"=>"Festa na Cobe do China", "id"=>"228651767221196"}]
          fql_hash = events_query()

          today_mock = DateTime.civil(2012, 1, 26)
          Time.stubs(:now).returns(today_mock)
          Date.stubs(:today).returns(today_mock.to_date)
          Koala::Facebook::API.any_instance.stubs(:get_connections).with('me', 'events').returns(connections_hash)
          Koala::Facebook::API.any_instance.stubs(:fql_query).returns(fql_hash)
          #Fim do Mundo - Eu Vou! <- created by me, open, future
          #LONDON CALLING <- created by me, open, future
          #CID, DOE SEU SALÁRIO! <- not created by me, open, future
          #teste <- created by me, secret, future
          #Festa na Cobe do China <- not created by me, secret, past

          visit login_path
          visit new_event_path
        end

        it "should retrieve user-created events from facebook" do
          click_on 'start'
          page.should have_content "Fim do Mundo - Eu vou!"
          page.should have_content "LONDON CALLING"
        end
        it "should retrieve events user has RSVP'd" do

        end
        specify "events should be public only" do
          pending "?"
          click_on 'start'
          page.should have_no_content "teste"
        end
        specify "events should be future only" do
          pending "?"
          click_on 'start'
          page.should have_no_content "Festa na Cobe do China"
        end
        specify "there should be an import button" do
          click_on 'start'
          page.should have_selector '.import'
        end

        context "selecting an event" do
          before do
            click_on 'start'
            @multiquery = multiquery()
            Koala::Facebook::API.any_instance.stubs(:fql_multiquery).returns(@multiquery)
            @event = @multiquery["event"][0]
            @creator = @multiquery["creator"][0]
            page.first('.import').click
          end

          it "should display event data from facebook" do
            page.should have_content "Fim do Mundo - Eu vou!"
            page.should have_content "No mundo inteiro"
            page.should have_content I18n.l Time.zone.parse(@event["start_time"])
            #TODO
            #page.should have_content Time.zone.parse(@event["end_time"]).to_s(:short)
            page.should have_content "Breno Salgado"
          end

          it "should prompt user to input tags" do
            page.should have_field "event-tags"
          end

          context "saving" do

            before do
              Koala::Facebook::API.any_instance.stubs(:fql_query).returns([@event])
            end

            specify "clicking on 'salvar' should save event and redirect to event page" do
              click_on 'salvar'
              current_path.should match '/events/[1-9]*'
            end

            specify "newly saved event should appear on calendar" do
              click_on 'salvar'
              visit '/'
              page.should have_content "Fim do Mundo - Eu vou!"
            end

          end


        end

      end

    end

  end
end
