Merit::Application.routes.draw do

  resources :pay_rates do
    member do
      get 'approve'
    end
  end

  devise_for :users
  
  resources :roles
  resources :users
  resources :comments
  resources :stores
  resources :accounts

  resources :employments do
    member do
      get 'end'
      get 'set_dates'
      put 'custom_dates'
    end
    collection do
      get 'cancel'
    end
  end

  resources :people do
    collection do
      get 'search'
    end
  end

  resources :appraisals do
    member do
      get 'perform'
      get 'view'
      get 'review'
      get 'approve'
      get 'unapprove'
    end
    collection do
      get 'setup_batch'
      post 'create_batch'
    end
  end




  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
     namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
       resources :users do
         member do
           get 'edit_password'
           get 'confirm'
         end
       end
       resources :appraisal_forms do
         member do
           get 'add_remove_sections'
           get 'add_section_to'
           get 'remove_section_from'
           get 'add_remove_feedback_topics'
           get 'add_feedback_topic_to'
           get 'remove_feedback_topic_from'
           get 'preview'
         end
       end
       resources :questions
       resources :sections do
         member do
           get 'add_remove_questions'
           get 'add_question_to'
           get 'remove_question_from'
         end
       end
       resources :positions
       resources :stores do
         collection do
           get 'search'
         end
       end
       resources :review_periods
       resources :feedback_topics
       match 'dashboard' => 'dashboard#index', :as => :dashboard
       resources :audits
     end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'
  authenticated :user do
    root :to => 'dashboard#index'
  end
  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
  match 'search/do' => 'search#do', :as => :do_search
  match 'dashboard/access_denied' => 'dashboard#access_denied', :as => :dashboard_access_denied
  match 'dashboard/index' => 'dashboard#index', :as => :dashboard
end
