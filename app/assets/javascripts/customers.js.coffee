# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $(document).ready ->
    $('#mainButton').click ->
      $('#mainForm').submit()

    $('#customer_address_attributes_city_id').parent().hide()
    cities = $('#customer_address_attributes_city_id').html()

    load_cities = (state, select_city, city) ->
      escaped_state = state.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
      # console.log escaped_state
      # console.log cities
      # console.log select_city
      # console.log city
      # console.log main_city
      options = $(cities).filter("optgroup[label='#{escaped_state}']").html()
      main_city = $('#customer_address_attributes_city_id').val()

      if options || main_city
        $('#customer_address_attributes_city_id').html(options)
        $('#customer_address_attributes_city_id').parent().show()
        if select_city == true
          $("#customer_address_attributes_city_id option").filter( (index) ->
            $(this).text() is city).attr('selected', 'selected')
      else
        $('#customer_address_attributes_city_id').empty()
        $('#customer_address_attributes_city_id').parent().hide()

    load_cities $('#customer_address_attributes_state_id :selected').text(), false, ''

    $('#customer_address_attributes_state_id').change ->
      if $(this).val() != ''
        state = $('#customer_address_attributes_state_id :selected').text()
        load_cities state, false, ''

    $("#customer_address_attributes_zipcode").change ->
      cep_code = $(this).val()
      if cep_code.length <= 0 then return
      $.get "http://apps.widenet.com.br/busca-cep/api/cep.json", { code: cep_code }, (result) ->
        if result.status != 1
          alert result.message or "Houve um erro desconhecido na consulta do CEP"
          return
        $("#customer_address_attributes_zipcode").val( result.code );
        $("#customer_address_attributes_estado").val( result.state );
        $("#customer_address_attributes_neighborhood").val( result.district );
        $("#customer_address_attributes_street").val( result.address );
        return $.ajax
          url: "/state"
          type: "GET"
          data:
            acronym: result.state
          success: (resp) -> $("#customer_address_attributes_state_id option").filter( (index) ->
            load_cities resp.name, true, result.city
            $(this).text() is resp.name).attr('selected', 'selected')

    $('form').on 'click', '.remove_fields', (event) ->
      $(this).prev('input[type=hidden]').val('1')
      $(this).closest('div').hide()
      event.preventDefault()

