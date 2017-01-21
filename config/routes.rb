Rails.application.routes.draw do
  get '/', to: "site#home"

  resources :projects, only: [:index, :show, :new, :create] do
    resources :time_entries, except: [:show]
  end

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
