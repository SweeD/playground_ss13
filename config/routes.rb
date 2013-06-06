Playground::Application.routes.draw do
  resources :receipes
  root to: 'receipes#index'
end
