Rails.application.routes.draw do
  root "notes#index"
  resources :notes do
    collection do
      post "update_status"
      post "update_priority"
      post "remove"
    end
  end
end
