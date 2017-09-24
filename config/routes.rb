Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  resources :links do
    get :vote
    get :link_vote
    get :down_vote
  end
  get '/' => 'links#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
