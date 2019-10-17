Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers
  resources :posts do
    member do
      post :like
    end
  end   
  resources :destinations
end
