require 'spec_helper'
describe TransientUser do

  before do
    @model = TransientUser.new
  end

  it_behaves_like "ActiveModel"
end
