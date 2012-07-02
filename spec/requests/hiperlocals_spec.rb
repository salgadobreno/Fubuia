#coding: UTF-8
require 'spec_helper'

describe "Hiperlocal" do

  before do
    @ebrasilia = create(:event, :city => City.find_by_subdomain('brasilia'), :fid => 1, :tag_list => "tagsilia")
    @erio = create(:event, :city => City.find_by_subdomain('rio'), :fid => 2, :tag_list => "tagrio")
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

      Koala::Facebook::API.any_instance.stubs(:fql_query).returns(@events)
  end

  it "Defaults city to Brasília" do
    visit '/'
    page.should have_content "Brasília"
  end

  context "brasilia.fubuia.com.br", :subdomain => 'brasilia' do

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


    specify "should point to Rio" do
      visit '/'
      page.should have_content "Rio de Janeiro"
    end

    specify "shouldn`t show event from Brasília" do
      visit '/'
      page.should have_content "botafogo"
      page.should_not have_content "gama"
    end

    specify "shouldn`t show tags in Brasilia event" do
      visit '/'
      page.should have_content "tagrio"
      page.should_not have_content "tagsilia"
    end

  end

end
