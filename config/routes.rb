Rails.application.routes.draw do
  devise_for :headhunters, path: 'headhunters'
  devise_for :users, path: 'users'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  authenticated :headhunter do
    root 'home#companies_index', as: :headhunter_root
  end
  authenticated :user do
    root 'home#index', as: :user_root
  end
  root to: 'home#index'
  get '/companies', to: 'home#companies_index'
end
