IbabaiApp::Application.routes.draw do
 
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :customers
  resources :promoacts do
    member do
      patch :recall, :drop, :submit
      delete :del_cont_tag, :del_cont_pres, :del_cont_desc 
    end
  end
  namespace :api, defaults: { format: :json } do
    namespace :v1 do         
      devise_scope :customer do
        post 'registrations' => 'registrations#create', as: 'register'
        post 'cessions' => 'cessions#create', as: 'login'
        delete 'cessions' => 'cessions#destroy', as: 'logout'
      end
      resources :cust_logs, only: :create
    end
  end  
  resources :promocities, only: :destroy
  resources :promosegments, only: :destroy
  resources :promocats, only: :destroy
  resources :promoprods, only: :destroy
  resources :promobrands, only: :destroy
  resources :promofeedbacks, only: :destroy
  resources :promorelations, only: :destroy
  resources :categories
  resources :segments
  resources :accounts, only: :show
  resources :brands, only: [:create, :update, :destroy]
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :password_resets
  resources :help_desks  
   
  root 'promoacts#index'
  match "/run", to: "charts#run", via: "post"
  match "/analytics", to: "charts#show" , via: "get" 
  match "/cust_seg", to: "users#cust_seg", via: "get"
  match "/signin", to: "sessions#new", via: "get"
  match "/signup", to: "users#new", via: "get"
  match "/help", to: "support#help", via: "get"
  match '/signout', to: 'sessions#destroy', via: "delete"
  match '/general_page', to: "support#general_page", via: "get"
  match '/status_page', to: "support#status_page", via: "get"
  match '/seg_page', to: "support#seg_page", via: "get"
  match '/cat_page', to: "support#cat_page", via: "get"
  match '/na_page', to: "support#na_page", via: "get"
  match '/ana_page', to: "support#ana_page", via: "get"
  match '/pro_page', to: "support#pro_page", via: "get"
  match '/com_page', to: "support#com_page", via: "get"
  match '/specs_page', to: "support#specs_page", via: "get"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
