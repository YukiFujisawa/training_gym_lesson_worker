Rails.application.routes.draw do
  root 'operating_companies#index'
  resources :shops
  resources :operating_companies do
    resources :shops
  end
end
