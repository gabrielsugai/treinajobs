Rails.application.routes.draw do
  devise_for :headhunters, path: 'headhunters'
  devise_for :users, path: 'users'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  authenticated :headhunter do
    root 'home#headhunter_index', as: :headhunter_root
  end
  authenticated :user do
    root 'home#user_index', as: :user_root
  end
  root to: 'home#index'
  get '/companies', to: 'home#companies_index'

  resources :user_profiles, only: [:show, :new, :create, :edit, :update] do
    get 'myapplys', on: :collection
    resources :comments, only: [:create]
  end
  
  resources :jobs, only: [:index, :show, :new, :create] do
    get 'end_job', on: :member
    resources :job_offers, only: [:index, :show, :new, :create] do
      get 'accept_message', on: :member
      patch 'accept_offer', on: :member
      get 'denied_message', on: :member
      patch 'denied_offer', on: :member
    end
    get 'candidates', on: :member
    resources :opportunities, only: [:index, :new, :create] do
      get 'feedback', on: :member
      get 'feature_candidate', on: :member
    end
  end
end
