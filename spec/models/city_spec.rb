require 'spec_helper'

describe City do

  it "requires a name" do
    City.new(:name => nil).should_not be_valid
  end

  it "requires a subdomain" do
    City.new(:subdomain => nil).should_not be_valid
  end

  it "has many events" do
    City.new.should respond_to(:events)
  end

end
