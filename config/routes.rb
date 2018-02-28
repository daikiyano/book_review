Rails.application.routes.draw do
	resources :books do
	resources :reviews

	get 'reviews/new'
	post 'reviews/create'

end
  devise_for :users
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories

root "books#index"
end
