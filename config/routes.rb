Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace 'api' do
    namespace 'v1' do
      resources :authors
      get "authors/search/:term", to: "authors#search"
      resources :books
      resources :articles
      resources :citations
    end

  end

end
