MicroFluidics::Application.routes.draw do

  resources :design_licenses

  resources :links
    
  resources :performances do
    member do
      get :show_img
      get :download
    end  # do
  end  # do

  resources :performances

  resources :useds

  resources :papers

  resources :instrument_types

  resources :instruments
    
  #  resources :attachments do
  #  collection do
  #    get 'show_img'
  #    post 'download'
  #    post 'upload'
  #  end  # do
  #end  # do

  resources :attachments do
    member do
      get :download
      get :show_image
      post :upload
    end  # do
  end  # do
    
  resources :attachments
    
  resources :softwares do
    member do
      get :download
    end  # do
  end  # do

  resources :softwares

  resources :members

  resources :users

  resources :teams
    
  resources :videos do
    collection do
      get :download
      get :show_video
      # post :upload
    end  # do
  end  # do

  resources :videos

  resources :comments

  resources :designs
    
  resources :images do
    collection do
      get 'show_img'
      post 'upload'
    end  # do
  end  # do

  resources :images

  resources :deriveds

  resources :licenses

  resources :attribute_values

  resources :attributes
    
  resources :logins
    
  resources :logins do
    collection do
      get  'logout', 'logins'
      post 'verify'
    end  # do
  end  # do

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
