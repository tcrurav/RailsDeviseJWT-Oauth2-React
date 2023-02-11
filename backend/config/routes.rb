# Rails.application.routes.draw do
  # resources :bicycles
#   devise_for :users
#   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# end

Rails.application.routes.draw do
  resources :bicycles, only: [:index, :show, :create, :update, :destroy]
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
  get '/member-data', to: 'members#show'
end
