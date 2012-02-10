class Session < Authlogic::Session::Base
  authenticate_with User
  allow_http_basic_auth false
end
