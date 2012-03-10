require 'spec_helper'
describe TransitionalEvent do

  before do
    @model = TransitionalEvent.new
  end

  it_behaves_like "ActiveModel"

  it "allows [] access to attributes" do
    lambda { TransitionalEvent.new[:x] }.should_not raise_exception(NoMethodError)
  end
end
