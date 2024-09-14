Rails.application.routes.draw do
  # devise routings
  devise_for :admin
  # homes controller
  root 'homes#top'
  get 'about' => 'homes#about'

  # customer's module
  scope module: :public do
    devise_for :customers
    # customers controller
    resource :customers, only: [:show, :edit, :update] do
      collection do
        post 'confirm'
        patch 'unsubscribe'
      end
    end

    # 


  end

  # admin's namespace
  namespace :admin do

  end
end
