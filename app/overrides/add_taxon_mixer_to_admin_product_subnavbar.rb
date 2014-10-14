Deface::Override.new(:virtual_path => "spree/admin/shared/_product_sub_menu",
                     :name => "add_taxon_mixer_admin_tab",
                     :insert_bottom => "[data-hook='admin_product_sub_tabs']",
                     :text => "<%= tab :taxon_mixer,  :url => admin_taxon_mixer_path %>",
                     :disabled => false)
