Rails.application.routes.draw do
  root "parks#index"
  resources :parks, only: [:index, :new, :create,:show] do
  end
end
