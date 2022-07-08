Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :end_users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root to: 'homes#top'

    resource :end_users, only:[:show, :edit, :update] do
      get "confirm" => "end_users#confirm"
      patch "withdrawal" => "end_users#withdrawal"
    end

    resources :documents do
      collection do
        get "word_search" => "documents#word_search"
        get "tag_search" => "documents#tag_search"
      end
    end
  end

  namespace :admin do
    get "/" => "home#top"

    resource :end_users, only:[:show, :edit, :update] do
      collection do
        get "word_search" => "end_users#word_search"
      end
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
