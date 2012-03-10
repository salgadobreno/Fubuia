require 'rioapi'
class RioApi
  CONFIG = YAML.load_file("#{Rails.root}/config/rioapi.yml")[Rails.env]
  APP_ID = CONFIG['app_id']
  APP_SECRET = CONFIG['app_secret']
end

RioApi.class_eval do
  class RioApiInicializationException < Exception; end;

  def initialize_with_default_settings(*args)
    case args.size
      when 0,1
        raise "application id and/or secret are not specified in the config" unless RioApi::APP_ID && RioApi::APP_SECRET
        initialize_without_default_settings(RioApi::APP_ID.to_s, RioApi::APP_SECRET.to_s)
        when 2,3
          initialize_without_default_settings(*args)
    end
  end

  def initialize_without_default_settings(*args)
    raise RioApiInicializationException
  end

  alias_method_chain :initialize, :default_settings
end
