module Spree
  module Api
    class TaxonMixerController < Spree::Api::BaseController
      def related_taxons
        taxon = Spree::Taxon.find(params[:id])
        products = taxon.products
        classifications = Spree::Classification.where(product_id: products.pluck(:id))
        related_taxons_ids = classifications.pluck(:taxon_id).uniq - [params[:id]];
        @taxons = Spree::Taxon.where(id: related_taxons_ids).page(params[:page]).per(500 || params[:per_page])
        render "spree/api/taxons/index"
      end
    end
  end
end