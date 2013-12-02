Headlines::Application.routes.draw do

  devise_for :users

  resources :headlines do
    collection do
      get :best
    end
    member do
      post :vote
    end
  end

  resources :users do
    resources :headlines
    resources :votes
  end

  get "leaderboard", to: "users#index"

  get "best", to: "headlines#best"

  get "generator", to: "generator#index"
  post "generator/generate", to: "generator#generate", as: :generate
  get "generator/save", to: "generator#save", as: :save

  root to: redirect("best")

end
