Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :mechanics, only: [:index, :show, :post]

  get "/mechanics", to: "mechanics#index"
  get "/mechanics/:id", to: "mechanics#show"
  get "/mechanics/:id/edit", to: "mechanics#edit"
  patch "/mechanics/:id", to: "mechanics#update"

  post "/mechanics/:id", to: "mechanic_rides#create"
  # post "/mechanics/:id/ride/:id", to: "mechanic_rides#create"

  get "/parks/:id", to: "parks#show"

end
