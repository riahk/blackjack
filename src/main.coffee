$('document').ready ->
  new AppView(model: new App()).$el.appendTo '#wrapper'
  $('#wrapper').on 'click', 'button.reset', ->
    $('#wrapper').html(new AppView(model: new App()).$el)
