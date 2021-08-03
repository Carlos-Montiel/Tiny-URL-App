Rails.application.routes.draw do
  resources :shorten_urls, except: [:edit, :update, :show]
  root to: 'shorten_urls#new'
  get ':token/info', to: 'shorten_urls#url_info', as: 'info_shorten_url'
  get ':token', to: 'shorten_urls#redirect_to_url', as: 'redirect_shorten_url'
end
