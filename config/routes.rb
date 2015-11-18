Rails.application.routes.draw do
  root to: "cats#index"
  resources :cats, only:[:index, :show, :new, :create, :edit, :update]
  resources :cat_rental_requests, only:[:index, :new, :create, :show]
end
