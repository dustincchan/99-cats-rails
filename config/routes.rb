Rails.application.routes.draw do
  get 'cat_rental_requests/new'

  get 'cat_rental_requests/create'

  get 'cat_rental_requests/index'

  root to: "cats#index"
  resources :cats, only:[:index, :show, :new, :create, :edit, :update]
end
