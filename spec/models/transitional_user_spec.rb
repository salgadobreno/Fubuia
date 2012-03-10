require 'spec_helper'
describe TransitionalUser do

  before do
    @model = TransitionalUser.new
  end

  it_behaves_like "ActiveModel"
end
