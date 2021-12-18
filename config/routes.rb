Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :cargoes, :ports, :routes, :ships 

end
