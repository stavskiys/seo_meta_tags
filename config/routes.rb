SeoMetaTags::Engine.routes.draw do

  resources :sets

  root 'sets#index'
end
