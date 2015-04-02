Ontime::Application.routes.draw do
  resources :invites

  resources :teams

  resources :games

  match 'invites/response' =>  'invites#invite_response', via: [:post, :get], as: 'invite_response'

  match 'invites/outteam' =>  'invites#out_team', via: [:post, :get], as: 'out_team'

  ### rota comentada abaixo => vou deixar escrito aqui pra vc lembrar

  # toda vez que alguem acessar 'invites/response' é pra acessar => 'controller#action', poderá ser atraves dos metodos :post, :get e o "apelido" dessa rota será 'invite_response'

  devise_for :users, controllers: {registrations: 'registrations'}

  devise_scope :user do
  get "/login" => "devise/sessions#new"
  get "/registrar" => "devise/registrations#new"
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'games#index' 

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
