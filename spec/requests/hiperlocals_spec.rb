#coding: UTF-8
require 'spec_helper'

describe "Hiperlocal" do

  before do
    @ebrasilia = Factory(:event, :city => City.find_by_subdomain('brasilia'), :fid => 1, :tag_list => "tagsilia")
    @erio = Factory(:event, :city => City.find_by_subdomain('rio'), :fid => 2, :tag_list => "tagrio")
    @events = JSON('[
      {
          "eid": 1,
          "name": "gama",
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
          "eid": 2,
          "name": "botafogo",
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
        }
      ]')
  end

  it "Defaults city to Brasília" do
    visit '/'
    page.should have_content "Brasília"
  end

  context "brasilia.fubuia.com.br", :subdomain => 'brasilia' do
    before do
      Koala::Facebook::API.any_instance.stubs(:fql_query).returns(@events)
    end

    specify "should point to Brasília" do
      visit '/'
      page.should have_content "Brasília"
    end

    specify "shouldn`t show event from Rio" do
      visit '/'
      page.should have_content "gama"
      page.should_not have_content "botafogo"
    end

    specify "shouldn`t show tags in Rio event" do
      visit '/'
      page.should have_content "tagsilia"
      page.should_not have_content "tagrio"
    end

  end

  context "rio.fubuia.com.br", :subdomain => 'rio' do

    before do
      RioApi.any_instance.stubs(:retrieve_token!).returns(nil)
      RioApi.any_instance.stubs(:get_eventos).returns(rio_events())
      Koala::Facebook::API.any_instance.stubs(:fql_query).returns(@events)
    end

    specify "should point to Rio" do
      visit '/'
      page.should have_content "Rio de Janeiro"
    end

    specify "shouldn`t show events from Brasília" do
      visit '/'
      page.should have_content "botafogo"
      page.should_not have_content "gama"
    end

    specify "shouldn`t show tags in Brasilia event" do
      visit '/'
      page.should have_content "tagrio"
      page.should_not have_content "tagsilia"
    end

    context "RioEvents" do

      specify "should display RioEvents" do
        visit '/'
        page.should have_content "Vampire Weekend"
        page.should have_content "Ensaio das Escolas de Samba"
      end

      context "Selecting a RioEvent" do

        specify "should display it`s individual page" do
          visit '/'
          page.should have_content "Vampire Weekend"
          click_on 'Vampire Weekend'
          page.should have_content "A banda novaiorquina formada em 2006"
          page.should have_content "Rio de Janeiro - Circo Voador"
        end

      end

    end

  end

end
