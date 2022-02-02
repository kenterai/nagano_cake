Rails.application.routes.draw do
  root to: "homes#top"
  get '/about' => 'homes#about',as:'about'

  namespace :admin do
    resources :genres, only:[:index, :create, :edit, :update]
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
  end

  scope module: :public do
    resource :customers, only:[:edit, :update, :quit, :out]
    get 'customers/my_page' => 'customers#show'
  end

  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
