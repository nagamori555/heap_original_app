Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  resources :users, only:[:index, :show] do
    resources :relationships, only: [:create, :destroy]
    resources :likes, only: [:index]
    get 'follows' => 'relationships#follower'
    get 'followers' => 'relationships#followed'
    resources :items, only: :index do
      collection do
        get 'search'
      end
    end
  end
  resources :items do
    resources :likes, only: [:create, :destroy]
  end
  get 'follows' => 'relationships#follower'
  get 'followers' => 'relationships#followed'
end
  