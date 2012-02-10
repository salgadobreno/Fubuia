require 'spec_helper'

describe User do

  before do
    @user = Factory.build(:user)
  end

  it "has facebook UID" do
    @user.should respond_to(:facebook_uid)
  end

  it "has an Access Token" do
    @user.should respond_to(:access_token)
  end

  it "has an e-mail" do
    @user.should respond_to(:email)
  end

  it "has events" do
    @user.should respond_to(:events)
  end

  context "validations" do

    it "requires facebook UID" do
      @user.facebook_uid =  nil
      @user.should_not be_valid
      @user.errors[:facebook_uid].should include(i18n 'errors.messages.blank')
    end

    it "requires Access Token" do
      @user.access_token = nil
      @user.should_not be_valid
      @user.errors[:access_token].should include(i18n 'errors.messages.blank')
    end

    it "requires a valid e-mail" do
      @user.email = nil
      @user.should_not be_valid
      @user.errors[:email].should include(i18n 'errors.messages.blank')
      @user.errors[:email].should include(i18n 'errors.messages.email_invalid')
    end

  end

  context "given it receives valid attributes" do

    it "should save successfully" do
      @user = Factory.build(:user)
      @user.save.should == true
    end

  end

end
