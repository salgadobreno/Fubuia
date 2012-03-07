#coding: UTF-8
require 'spec_helper'

describe "Events" do

  describe "show" do
    before do
      @event_db = Factory(:event, :fid => 12345 )
      @multiquery = {"event"=>
                      [{"eid"=>12345,
                        "name"=>"Fim do Mundo - Eu vou!",
                        "creator"=>1,
                        "privacy"=>"OPEN",
                        "pic_small"=>
                         "http://profile.ak.fbcdn.net/hprofile-ak-snc4/174576_105417699523664_1684222_t.jpg",
                        "pic_big"=>
                         "http://profile.ak.fbcdn.net/hprofile-ak-snc4/50236_105417699523664_1798087_n.jpg",
                        "location"=>"No mundo inteiro",
                        "venue"=>{"street"=>"", "city"=>"", "state"=>"", "country"=>""},
                        "start_time"=>1327622400,
                        "end_time"=>1327622400}],
                     "creator"=>
                        [{"name"=>"Breno Salgado",
                          "pic_small"=>
                           "x.jpg",
                          "profile_url"=>"http://www.facebook.com/breno.salgado"}]}
      Koala::Facebook::API.any_instance.stubs(:fql_multiquery).returns(@multiquery)
      @event = @multiquery["event"][0]
      @creator = @multiquery["creator"][0]
    end

    it "should display the event info from facebook" do
      visit event_path(@event_db)
      page.should have_content "Breno Salgado"
      page.should have_content "No mundo inteiro"
      page.should have_content "Fim do Mundo - Eu vou!"
    end

    context "comments", :js => true do

      it "should display the event feed from facebook" do
        @event_db = Factory(:event, :fid => 12345 )
        @multiquery = {"event"=>
                [{"eid"=>12345,
                  "name"=>"Fim do Mundo - Eu vou!",
                  "creator"=>1,
                  "privacy"=>"OPEN",
                  "pic_small"=>
                   "http://profile.ak.fbcdn.net/hprofile-ak-snc4/174576_105417699523664_1684222_t.jpg",
                  "pic_big"=>
                   "http://profile.ak.fbcdn.net/hprofile-ak-snc4/50236_105417699523664_1798087_n.jpg",
                  "location"=>"No mundo inteiro",
                  "venue"=>{"street"=>"", "city"=>"", "state"=>"", "country"=>""},
                  "start_time"=>1327622400,
                  "end_time"=>1327622400}],
               "creator"=>
                  [{"name"=>"Breno Salgado",
                    "pic_small"=>
                     "x.jpg",
                    "profile_url"=>"http://www.facebook.com/breno.salgado"}]}
        Koala::Facebook::API.any_instance.stubs(:fql_multiquery).returns(@multiquery)
        @event = @multiquery["event"][0]
        @creator = @multiquery["creator"][0]
        visit event_path(@event_db)
        page.should have_content "Vitor Agrello"
        page.should have_content "Vai pedir Identidade?"
        page.should have_content "hahahahaha demais"
      end

    end
  end

  describe "new" do
    before(:each) do
      visit new_event_path
    end

    it "should display information about the importing proccess" do
      page.should have_content i18n('pages.events.process').split(' ')[0..2].join(' ')
    end

    it "should display a 'start' link" do
      page.should have_selector '#start'
    end

    context "clicking on 'start' link" do

      #context "if users not logged in or haven't given all required permissions to app", :js => true do

      #  it "opens oauth dialog which redirects to import events page" do
      #    click_on 'start'
      #    page.driver.browser.switch_to().window(page.driver.browser.window_handles.last)
      #    page.current_url.should match "facebook.com"
      #  end
      #end

      context "user logged in" do
        before do
          connections_hash = [{"name"=>"Fim do Mundo - Eu vou!", "id"=>"105417699523664"}, {"name"=>"CAMPANHA: CID, DOE SEU SALÁRIO!", "id"=>"226420880736785"}, {"name"=>"LONDON CALLING Summer Edition**show com JOHNNY FLIRT e CASSINO SUPERNOVA",  "id"=>"317163524988819"}, {"name"=>"teste", "id"=>"372742442742194"}, {"name"=>"Festa na Cobe do China", "id"=>"228651767221196"}]
          fql_hash = JSON('[
                              {
                                "eid": 105417699523664,
                                "name": "Fim do Mundo - Eu vou!",
                                "creator": 1,
                                "privacy": "OPEN",
                                "location": "No mundo inteiro",
                                "venue": {
                                  "street": "",
                                  "city": "",
                                  "state": "",
                                  "country": ""
                                },
                                "start_time": 1327622400,
                                "end_time": 1327622400
                              },
                              {
                                "eid": 226420880736785,
                                "name": "CID, DOE SEU SALÁRIO!",
                                "creator": 100001678599737,
                                "privacy": "OPEN",
                                "location": "Ceará",
                                "venue": {
                                  "street": "",
                                  "city": "",
                                  "state": "",
                                  "country": ""
                                },
                                "start_time": 1328002200,
                                "end_time": 1328013000
                              },
                              {
                                "eid": 317163524988819,
                                "name": "LONDON CALLING",
                                "creator": 1,
                                "privacy": "OPEN",
                                "location": "Club 904 (Clube da ASCEB - 904 Sul)",
                                "venue": {
                                  "street": "",
                                  "city": "",
                                  "state": "",
                                  "country": "",
                                  "latitude": -15.800694566667,
                                  "longitude": -47.900688083333,
                                  "id": 212762192067615
                                },
                                "start_time": 1327818600,
                                "end_time": 1327840200
                              },
                              {
                                "eid": 372742442742194,
                                "name": "teste",
                                "creator": 1,
                                "privacy": "SECRET",
                                "location": "Asd photographe",
                                "venue": {
                                  "street": "",
                                  "city": "",
                                  "state": "",
                                  "country": "",
                                  "latitude": 48.508703720942,
                                  "longitude": 2.463682145747,
                                  "id": 242509969118609
                                },
                                "start_time": 1327586400,
                                "end_time": 1327597200
                              },
                              {
                                "eid": 228651767221196,
                                "name": "Festa na Cobe do China",
                                "creator": 1,
                                "privacy": "SECRET",
                                "location": "SQN 208 Bloco H",
                                "venue": {
                                  "street": "",
                                  "city": "",
                                  "state": "",
                                  "country": ""
                                },
                                "start_time": 1327201200,
                                "end_time": 1327217400
                              }
                            ]')
          #Fim do Mundo - Eu Vou! <- created by me, open, future
          #CID, DOE SEU SALÁRIO! <- not created by me, open, future
          #LONDON CALLING <- created by me, open, future
          #teste <- created by me, secret, future
          #Festa na Cobe do Chine <- not created by me, secret, past

          me = {'id' => '1','email' => 'eu@eu.com','name' => 'Breno Salgado'}

          today_mock = DateTime.civil(2012, 1, 26)
          Time.stubs(:now).returns(today_mock)
          Date.stubs(:today).returns(today_mock.to_date)
          Koala::Facebook::API.any_instance.stubs(:get_connections).with('me', 'events').returns(connections_hash)
          Koala::Facebook::API.any_instance.stubs(:fql_query).returns(fql_hash)
          Koala::Facebook::API.any_instance.stubs(:get_object).with('me').returns(me)
          facebook_events_mocks()
          #Fim do Mundo - Eu Vou! <- created by me, open, future
          #LONDON CALLING <- created by me, open, future
          #CID, DOE SEU SALÁRIO! <- not created by me, open, future
          #teste <- created by me, secret, future
          #Festa na Cobe do China <- not created by me, secret, past
          me = {'id' => '1','email' => 'eu@eu.com','name' => 'Breno Salgado'}
          Koala::Facebook::API.any_instance.stubs(:get_object).with('me').returns(me)
          Koala::Facebook::API.any_instance.stubs(:get_object).with(1).returns(me)
          page.driver.get login_path(:code => "1234")
          visit new_event_path
        end

        it "should retrieve user-created events from facebook" do
          click_on 'start'
          page.should have_content "Fim do Mundo - Eu vou!"
          page.should have_content "LONDON CALLING"
        end
        specify "events should be future only" do
          click_on 'start'
          page.should have_no_content "Festa na Cobe do China"
        end
        specify "events should be public only" do
          click_on 'start'
          page.should have_no_content "teste"
        end
        specify "there should be an import button" do
          click_on 'start'
          page.should have_selector '.import'
        end

        context "selecting an event" do
          before do
            click_on 'start'
            @multiquery =
              {"event"=>
                [{"eid"=>105417699523664,
                  "name"=>"Fim do Mundo - Eu vou!",
                  "creator"=>1,
                  "privacy"=>"OPEN",
                  "pic_small"=>
                   "http://profile.ak.fbcdn.net/hprofile-ak-snc4/174576_105417699523664_1684222_t.jpg",
                  "pic_big"=>
                   "http://profile.ak.fbcdn.net/hprofile-ak-snc4/50236_105417699523664_1798087_n.jpg",
                  "location"=>"No mundo inteiro",
                  "venue"=>{"street"=>"", "city"=>"", "state"=>"", "country"=>""},
                  "start_time"=>1327622400,
                  "end_time"=>1327622400}],
               "creator"=>
                  [{"name"=>"Breno Salgado",
                    "pic_small"=>
                     "x.jpg",
                    "profile_url"=>"http://www.facebook.com/breno.salgado"}]}
            Koala::Facebook::API.any_instance.stubs(:fql_multiquery).returns(@multiquery)
            @event = @multiquery["event"][0]
            @creator = @multiquery["creator"][0]
            page.first('.import').click
          end

          it "should display event data from facebook" do
            page.should have_content "Fim do Mundo - Eu vou!"
            page.should have_content "No mundo inteiro"
            page.should have_content Time.at(@event["start_time"]).to_s(:short)
            page.should have_content Time.at(@event["end_time"]).to_s(:short)
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
