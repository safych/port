Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :cargoes, :ship_ports, :routes, :ships 

end
