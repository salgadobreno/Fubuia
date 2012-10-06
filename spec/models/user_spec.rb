require 'spec_helper'

describe User do

  before do
    @user = build(:user)
  end

  it "has facebook UID" do
    @user.should respond_to(:uid)
  end

  it "has an Oauth Token" do
    @user.should respond_to(:oauth_token)
  end

  it "has an e-mail" do
    @user.should respond_to(:email)
  end

  it "has events" do
    @user.should respond_to(:events)
  end

  context "validations" do

    it "requires facebook UID" do
      @user.uid =  nil
      @user.should_not be_valid
      @user.errors[:uid].should include(i18n 'errors.messages.blank')
    end

    it "requires Access Token" do
      @user.oauth_token = nil
      @user.should_not be_valid
      @user.errors[:oauth_token].should include(i18n 'errors.messages.blank')
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
      @user = build(:user)
      @user.save.should == true
    end

  end

end
