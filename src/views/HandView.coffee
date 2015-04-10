class window.HandView extends Backbone.View
  className: 'hand'

  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @collection.on 'add remove change', => @render()
    @render()

  hit: ->
    @collection.hit()

  stand: ->
    console.log @collection
    @collection.stand()

  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    scores = @collection.scores()
    if(scores[0] != scores[1] and scores[1] < 21)
      @$('.score').text scores.toString()
    else
      @$('.score').text scores[0]

