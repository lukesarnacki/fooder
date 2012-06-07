Fooder::Application.routes.draw do

  resources :products
  resources :ingredients
  resources :labels, :only => [:create]

end
