class User < ActiveRecord::Base

  acts_as_authentic do |c|
    c.session_class = Session
  end

  #associations
  has_many :events

  #validations
  validates :uid, :presence => true
  validates :oauth_token, :presence => true
  validates :email, :presence => true, :format => {:with => Authlogic::Regex.email, :message => I18n.t('errors.messages.email_invalid')}

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.email = auth.info.email

      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

end
