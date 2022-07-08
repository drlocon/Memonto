Rails.application.routes.draw do
  namespace :public do
    get 'documents/new'
    get 'documents/index'
    get 'documents/show'
    get 'documents/edit'
    get 'documents/word_search'
    get 'documents/tag_search'
  end
  namespace :public do
    get 'end_users/show'
    get 'end_users/edit'
    get 'end_users/confirm'
  end
  namespace :admin do
    get 'end_users/show'
    get 'end_users/edit'
    get 'end_users/word_search'
  end
  namespace :public do
    get 'homes/top'
  end
  namespace :admin do
    get 'homes/top'
  end
  devise_for :admins
  devise_for :end_users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
