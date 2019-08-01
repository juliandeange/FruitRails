Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    resources :category do
        resources :fruit, only: [:show, :index, :create]
    end
    resources :fruit, only: [:show, :update, :destroy]

end
