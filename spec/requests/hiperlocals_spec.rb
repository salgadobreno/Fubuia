#coding: UTF-8
require 'spec_helper'

describe "Hiperlocal" do

  it "Defaults city to Brasília" do
    visit '/'
    page.should have_content "Brasília"
  end

  context "brasilia.fubuia.com.br", :subdomain => 'brasilia' do

    specify "should point to Brasília" do
      visit '/'
      page.should have_content "Brasília"
    end

  end

  context "rio.fubuia.com.br", :subdomain => 'rio' do

    before do
      RioApi.any_instance.stubs(:retrieve_token!).returns(nil)
      RioApi.any_instance.stubs(:get_eventos).returns(rio_events())
    end

    specify "should point to Rio" do
      visit '/'
      page.should have_content "Rio de Janeiro"
    end

    specify "should display RioEvents" do

    end

  end

end
