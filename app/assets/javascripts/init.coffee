$(document).on 'ready turbolinks:load', ->
  $('.datepicker').pickadate({
    selectMonths: true,
    selectYears: 15,
    today: 'Today',
    clear: 'Clear',
    close: 'Ok',
    closeOnSelect: true
  });
  $('.button-collapse').sideNav({
      menuWidth: 200,
      edge: 'left',
      closeOnClick: true,
      draggable: true
    }
  );
  $('.collapsible').collapsible();
  $('.dropdown-button').dropdown({
    inDuration: 300,
    outDuration: 225,
    constrainWidth: false, # Does not change width of dropdown to that of the activator
    hover: true, # Activate on hover
    gutter: 0, # Spacing from edge
    belowOrigin: false, # Displays dropdown below the button
    alignment: 'left', # Displays dropdown with edge aligned to the left of button
    stopPropagation: false # Stops event propagation
  });
  $('.modal').modal();
  $('select').material_select();
  Waves.displayEffect()
  console.log "load init on ready or turbolinks:load"


  $('textarea').trigger('autoresize')
  $('span.help-text').each ->
    $value = $(this)[0].innerHTML
    $(this).addClass 'hide'
    $(this).parents('div.input-field').children('label').attr(
      'data-hint', $value
    );
