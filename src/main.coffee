$('document').ready ->
  new AppView(model: new App()).$el.appendTo '#wrapper'
