Rails.application.routes.draw do
  resources :ldap
  get 'users_by_email' => 'users#show_by_email'
  mount_devise_token_auth_for 'User', at: 'auth',
    controllers: {
      sessions: 'sessions'
    }

     wash_out :ws_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
