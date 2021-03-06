Rails.application.routes.draw do

  resources :job_applications
  resources :jobs
  mount Ckeditor::Engine => '/ckeditor'
  resources :reviews

  get 'referrals/download' => 'referrals#download'
  get 'referrals/processed' => 'referrals#processed_referrals', as: :processed_referrals
  delete "referrals" => "referrals#destroy_all"
  resources :referrals

  resources :news_releases

  get 'appointments/download' => 'appointments#download'
  get 'appointments/processed' => 'appointments#processed_appointments', as: :processed_appointments
  delete "appointments" => "appointments#destroy_all"

  resources :appointments
  resources :contacts

  post "experts/sort" => "experts#sort"

  resources :experts
  resource :session
  resources :users
  resources :pages
  root 'pages#home'
  get 'dashboard' => 'pages#dashboard'
  get 'clinical_trials_dashboard' => 'pages#clinical_trials_dashboard'
  get 'search' => 'pages#search'

  get 'admin/news_releases' => 'admin/news_releases#index', as: :admin_news_releases
  delete 'admin/news_release/:id' => 'admin/news_releases#destroy', as: :admin_news_release

  namespace :admin do
    resources :slides
  end


#  match "/Staff/Employee.aspx?id=1" => "/experts/1826"
#  get "/Staff/Employee.aspx?id=1" => redirect("/experts/1826", status: 301)
  
  


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
