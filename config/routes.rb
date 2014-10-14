Spree::Core::Engine.routes.draw do
end
Spree::Core::Engine.routes.append do
  namespace :admin do
    get '/taxon_mixer', :to => "taxon_mixer#index", :as => :taxon_mixer
  end
  namespace :api, defaults: { format: 'json' } do
    get '/taxon_mixer/related_taxons', to: 'taxon_mixer#related_taxons', as: :taxon_mixer_related_taxons
  end
end
