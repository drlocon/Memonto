Rails.application.routes.draw do
  # devise/adminサイド
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  
  # devise/publicサイド
  devise_for :end_users, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }
  
  # ゲストログイン
  devise_scope :end_user do
    post 'end_users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  # publicサイド
  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    get '/service' => 'homes#service'
    get '/privacy' => 'homes#privacy'

    resources :end_users, only: [:show, :edit, :update] do
      get 'confirm' => 'end_users#confirm'
      patch 'withdrawal' => 'end_users#withdrawal'
      get 'favorites' => 'end_users#favorites'
    end

    resources :documents do
      resource :favorites, only: [:create, :destroy]
      collection do
        get 'word_search' => 'documents#word_search'
        get 'tag_search' => 'documents#tag_search'
      end
    end
  end

  # adminサイド
  namespace :admin do
    get '/' => 'homes#top'

    resources :end_users, only:[:show, :edit, :update] do
      collection do
        get 'word_search' => 'end_users#word_search'
      end
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
