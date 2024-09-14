Rails.application.routes.draw do
  devise_for :admin
  devise_for :customers
end
