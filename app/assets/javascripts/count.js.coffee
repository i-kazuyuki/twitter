ready = ->
  
  $('.form-control').on('keyup keydown keypress change',->
      thisValueLength = $(this).val().length
      limit = 255
      if thisValueLength < limit
        $('.count').html(limit - thisValueLength).removeClass("text-danger")
      else
        $('.count').html(limit - thisValueLength).addClass("text-danger")
  ).keyup()
  
$(document).ready(ready)
$(document).on('page:load', ready)