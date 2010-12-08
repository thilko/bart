Bart::Application.routes.draw do
 
  resources :servers do
    member do
      get "/deploy" => "servers#deploy", :as => "deploy"
      get "/finish" => "servers#finish"
      get "/error" => "servers#error"
    end
  end
  root :to => "servers#index"
end
