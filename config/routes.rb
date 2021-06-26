Rails.application.routes.draw do
  get '/current_user', to: 'current_user#index'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :pokemons, :only => [:index, :show]
      resources :user_pokemons, :only => [:index, :show, :create, :update, :destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIyNGE5NGZhNy0zMGYwLTRmZTgtODYzZi0xNzBjMGVkNWYwNmYiLCJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjI0NjMyMTk5LCJleHAiOjE2MjQ2MzM5OTl9.cvLrACQee_2TUmUX08nP4F-LLlB4TBWvzOotyFIkjeA
