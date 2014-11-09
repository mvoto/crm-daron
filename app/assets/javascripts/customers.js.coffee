# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#customer_address_attributes_city_id').parent().hide()
  cities = $('#customer_address_attributes_city_id').html()
  $('#customer_address_attributes_state_id').change ->
    if $(this).val() != ''
      state = $('#customer_address_attributes_state_id :selected').text()
      escaped_state = state.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
      options = $(cities).filter("optgroup[label=#{escaped_state}]").html()
      if options
        $('#customer_address_attributes_city_id').html(options)
        $('#customer_address_attributes_city_id').parent().show()
      else
        $('#customer_address_attributes_city_id').empty()
        $('#customer_address_attributes_city_id').parent().hide()
