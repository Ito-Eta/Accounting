Rails.application.routes.draw do
  get 'accounts/index'
  get 'sessions/new'
  get 'users/new'
  get 'welcome/index'
  get '/register' => 'users#new'
  post '/login' => 'sessions#create'
  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  get '/accounts' => 'accounts#index'
  get '/new_account' => 'accounts#new'
  get '/details' => 'entries#index'
  get '/new_entry' => 'entries#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :accounts do
      resources :entries
    end
  end

  root 'welcome#index'
end
