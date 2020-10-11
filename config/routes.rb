Rails.application.routes.draw do
  root "parks#new"
  resources :parks, only: [:index, :new, :create] do
  end
end
