Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace 'api' do
    namespace 'v1' do
      resources :authors
      resources :books
      resources :articles
      resources :citations

      get 'search', to: 'search#index'
    end

  end

end
