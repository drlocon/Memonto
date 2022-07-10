Rails.application.routes.draw do
  # devise/adminサイド
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # publicサイド
  scope module: :public do
    root to: 'homes#top'

    resources :end_users, only: [:show, :edit, :update] do
      get "confirm" => "end_users#confirm"
      patch "withdrawal" => "end_users#withdrawal"
    end

    resources :documents do
      resource :favorites, only: [:create, :destroy]
      collection do
        get "word_search" => "documents#word_search"
        get "tag_search" => "documents#tag_search"
      end
    end
  end
  
  # devise/publicサイド
  devise_for :end_users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # adminサイド
  namespace :admin do
    get "/" => "homes#top"

    resources :end_users, only:[:show, :edit, :update] do
      collection do
        get "word_search" => "end_users#word_search"
      end
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
