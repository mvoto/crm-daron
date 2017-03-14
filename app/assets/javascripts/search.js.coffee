cal_opts = {
  locale: 'pt-br',
  format: 'DD/MM/YYYY',
  extraFormats: [ 'DD/MM/YY' ],
  viewMode: 'years'
}

jQuery ->
  $(document).ready ->
    $('#dob_gteq_datetimepicker').datetimepicker(cal_opts)
    $('#dob_lteq_datetimepicker').datetimepicker(cal_opts)
