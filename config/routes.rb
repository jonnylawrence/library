Rails.application.routes.draw do
   api_version(:module => "V1", :path => {:value => "v1"}) do
    #resources :books
    resources :legacyapis
  end  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  get '/v1/legacyapis/:email', to: 'v1/legacyapis#show', constraints: { email: /[^\/]+/}
  mount Sail::Engine => '/sail'
  root '/sail'
  end
