Fubuia::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config

  get '/cofcof/filter_me' => 'application#filter_me_out'

  post '/f_e_s', :to => "events#f_e_u"
  get '/f_e_s', :to => "events#f_e_s"
  get '/facebook_subscription', :to => "events#f_e_u"
  post '/facebook/subscription', :to => "events#f_e_u"
  match '/test', :to => "events#gmailtest"

  post '/events/:id/create' => 'events#create', :as => :create_event
  match '/events/import/:eid' => 'events#import', :as => :import_event
  match '/events/start_import' => 'events#start_import', :as => :start_events_import
  resources :events, :except => [:index, :create]

  match 'auth/failure', to: redirect('/')
  match '/logout' => 'authentication#destroy', :as => :logout
  match 'auth/:provider/callback', to: "authentication#create", :as => :login, :defaults => {provider:"facebook"}
  root :to => "calendar#index"
  ActiveAdmin.routes(self)

end
