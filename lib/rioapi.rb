require 'rubygems'
require 'httparty'

class RioApi

  attr_accessor :app_id, :app_secret, :access_token, :expire_time

  include HTTParty
  format :json
  base_uri 'http://api.riodatamine.com.br/rest'
  default_params :format => 'json'
  #debug_output

  def default_options
    {:access_token => self.access_token}
  end

  def initialize(app_id, app_secret)
    @app_id = app_id
    @app_secret = app_secret
  end

  def get_bairros(options = {})
    authenticated!
    self.class.get('/demografia/bairros', :query => default_options.merge(options))
  end

  def get_eventos(options = {})
    authenticated!
    self.class.get('/visitar-rio/eventos', :query => default_options.merge(options))
  end

  def retrieve_token!
    response = self.class.get('/request-token', :query => {'app-id' => self.app_id, 'app-secret' => self.app_secret})
    if response.response.is_a? Net::HTTPSuccess
      self.access_token = response['x-access-token']
      self.expire_time = Time.at(response['x-access-token-expires'].to_i)
    elsif !response['x-error'].nil? || !response['x-error'].empty?
      raise Exception, response['x-error-reason']
    end
    response
  end

  private

  def authenticated!
    raise Exception, "This action requires authentication" if self.access_token.nil? || self.access_token.empty?
  end

end
