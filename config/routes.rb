Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :signup, only: %i(index create)
  resources :login, only: %i(login) do
    post :login, on: :member
  end
  resources :home, only: %i(index)
  resources :project, only: %i(create show)
  resources :mypage, only: %i(show)
end
