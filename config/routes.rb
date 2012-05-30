Templates::Application.routes.draw do
  root :to => "whatevs#index"
  match "whatevs/api" => "whatevs#api"
  resources :whatevs
end
