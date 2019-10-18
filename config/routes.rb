Rails.application.routes.draw do
  resources :bloggers 
  resources :destinations
  resources :posts do
    get 'like', to: 'posts#like', as: 'like'
  end
end
