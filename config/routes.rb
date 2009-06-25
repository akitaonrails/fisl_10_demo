ActionController::Routing::Routes.draw do |map|
  map.namespace :admin do |admin|
    admin.resources :posts
    admin.resources :comments
  end
  map.resources :posts, :has_many => :comments
  map.root :controller => "posts"
end
