Spree.routes.taxon_mixer_related_taxons_api = Spree.pathFor('api/taxon_mixer/related_taxons')

$(document).ready ->
  if $('#taxon_mixer_id').length > 0
    $('#taxon_mixer_id').select2
      dropdownCssClass: "taxon_select_box",
      placeholder: Spree.translations.find_a_taxon,
      ajax:
        url: Spree.routes.taxons_search,
        datatype: 'json',
        data: (term, page) ->
          per_page: 50,
          page: page,
          q:
            name_cont: term
        results: (data, page) ->
          more = page < data.pages;
          results: data['taxons'],
          more: more
      formatResult: (taxon) ->
        taxon.pretty_name;
      formatSelection: (taxon) ->
        taxon.pretty_name;
  $('#taxon_mixer_id').on "change", (e) ->
    el = $('#taxon_related_taxons')
    $.ajax
      url: Spree.routes.taxon_mixer_related_taxons_api,
      data:
        id: e.val
      success: (data) ->
        el.empty();
        if data.taxons.length == 0
          $('#sorting_explanation').hide()
          el.html("<h4>" + Spree.translations.no_results + "</h4>")
        else
          for taxon in data.taxons
            el.append('<li>' + taxon.pretty_name + '</li>')
          $('#sorting_explanation').show()
