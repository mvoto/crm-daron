cal_opts = {
  locale: 'pt-br',
  format: 'DD/MM/YYYY',
  extraFormats: [ 'DD/MM/YY' ],
  viewMode: 'years'
}

jQuery ->
  $(document).ready ->
    $('.input-daterange input').each ->
      $(this).datetimepicker(cal_opts)
