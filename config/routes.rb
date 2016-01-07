Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions", registrations: 'users/registrations', passwords: 'users/passwords' }

  root to: 'sessions#new'

  devise_scope :user do
    get '/saml/auth' => 'saml_idp#new'
    post '/saml/auth' => 'saml_idp#create'
  end
end
