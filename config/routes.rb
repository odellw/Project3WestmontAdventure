Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index', as: 'home'
  resources :adventures do
    resources :scenes do
      resources :decisions
    end
  end
end
