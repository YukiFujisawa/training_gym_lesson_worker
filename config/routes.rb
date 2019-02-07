Rails.application.routes.draw do
  resources :shops
  resources :operating_companies do
    resources :shops
  end
end
