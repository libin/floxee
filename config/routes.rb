ActionController::Routing::Routes.draw do |map|
  
  map.namespace :admin do |admin|
    admin.resources :people, :member => {:confirm_destroy => :get}
    admin.resources :users
  end
  
  map.paginated_users 'users/page/:page', :controller => 'people', :action => 'index', :page => 1
  map.resources :users, :member => {:tweetstream => :get, :follow => :get}, :collection => {:follow_all => :get}
  
  
  map.paginated_people 'people/page/:page', :controller => 'people', :action => 'index', :page => 1
  map.resources :people, :member => {:tweetstream => :get, :follow => :get}, :collection => {:follow_all => :get}
  
  map.with_options :controller => 'main' do |m|
    m.tweetstream 'tweetstream/:page', :action => 'tweetstream', :page => 1
    m.stats 'stats', :action => 'stats'
  end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  #map.root :controller => "main"
end
