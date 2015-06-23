Rails.application.routes.draw do
  root "notes#index"
  resources :notes do
    collection do
      post "update_status"
      post "update_priority"
      post "remove"
      post "update_note"
    end
  end
end
