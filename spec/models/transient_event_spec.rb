require 'spec_helper'
describe TransientEvent do

  before do
    @model = TransientEvent.new
  end

  it_behaves_like "ActiveModel"

  it "allows [] access to attributes" do
    lambda { TransientEvent.new[:x] }.should_not raise_exception(NoMethodError)
  end
end
