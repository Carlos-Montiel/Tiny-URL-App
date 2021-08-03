Rails.application.routes.draw do
  resources :shorten_urls, except: [:edit, :update]
  root to: 'shorten_urls#new'
end
