Spree::Core::Engine.routes.draw do
end
Spree::Core::Engine.routes.append do
  namespace :admin do
    get '/taxon_mixer', :to => "taxon_mixer#index", :as => :taxon_mixer
  end
end
