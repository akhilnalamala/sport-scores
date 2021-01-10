Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "scores#index"

  get "/NBA", to: "scores#nba"
  get "/NFL", to: "scores#nfl"
  get "/NHL", to: "scores#nhl"
  get "/MLB", to: "scores#mlb"

end