class User < ActiveRecord::Base

  acts_as_authentic do |c|
    c.session_class = Session
  end

  #associations
  has_many :events

  #validations
  validates :facebook_uid, :presence => true
  validates :access_token, :presence => true
  validates :email, :presence => true, :format => {:with => Authlogic::Regex.email, :message => I18n.t('errors.messages.email_invalid')}


end
