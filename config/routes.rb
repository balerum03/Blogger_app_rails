Blogger1::Application.routes.draw do
  root to: 'articles#index'

  resources :articles
end
