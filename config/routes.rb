Rails.application.routes.draw do


  resources :cutes do
    member do
      put "like", to:    "cutes#upvote"
      put "dislike", to: "cutes#downvote"
    end
    resources :commentgs
  end

  resources :girls do
    member do
      put "like", to:    "girls#upvote"
      put "dislike", to: "girls#downvote"
    end
    resources :commentgs
  end

  resources :wtfs do
    member do
      put "like", to:    "wtfs#upvote"
      put "dislike", to: "wtfs#downvote"
    end
    resources :commentgs
  end

  resources :memes do
    member do
      put "like", to:    "memes#upvote"
      put "dislike", to: "memes#downvote"
    end
    resources :commentgs
  end

  resources :gkeeys do
    member do
      put "like", to:    "gkeeys#upvote"
      put "dislike", to: "gkeeys#downvote"
    end
    resources :commentgs
  end

  resources :comments

  devise_for :users

  resources :links do
    member do
      put "like", to:    "links#upvote"
      put "dislike", to: "links#downvote"
    end
    resources :comments
  end
  root "links#index"

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
