# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on 'change', '#roottypes_select', (evt) ->
    $.ajax 'update_parts',
      type: 'GET'
      dataType: 'script'
      data: {
        roottype: $("#roottypes_select option:selected").val()
      }

      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error YO: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic section select OK!")
