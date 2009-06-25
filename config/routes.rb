ActionController::Routing::Routes.draw do |map|
  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
  map.resource :account, :controller => "users", :action => "edit"
  map.resources :user_sessions
  map.resources :users
  
  map.connect "posts/page/:page", :controller => "posts", :action => "index",
    :requirements => { :page => /\d+/ }, :page => nil

  map.namespace :admin do |admin|
    admin.resources :posts
    admin.resources :comments
    admin.resources :uploads
  end
  map.resources :posts, :has_many => :comments
  map.root :controller => "posts"
end
