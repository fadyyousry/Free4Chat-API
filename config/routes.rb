Rails.application.routes.draw do
  post 'login', to: 'authentication#authenticate'
  resources :users, only: [:show, :create, :destroy]
  resources :connections, except: [:update]
  resources :chats do
    resources :messages, except: [:update]
  end
end
