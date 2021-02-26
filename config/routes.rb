Rails.application.routes.draw do

  get "/mechanics", to: "mechanics#index"
  get "/mechanics/:id", to: "mechanics#show"
  get "/mechanics/:id/edit", to: "mechanics#edit"
  patch "/mechanics/:id", to: "mechanics#update"

  post "/mechanics/:id", to: "mechanic_rides#create"

  get "/parks/:id", to: "parks#show"


end
