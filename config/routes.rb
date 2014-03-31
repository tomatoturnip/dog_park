DogPark::Application.routes.draw do
  resources :register_dogs, only: [:new, :index, :create]
end
