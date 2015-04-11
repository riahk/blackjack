class window.AppView extends Backbone.View
  template: _.template '
    <div class="result"></div>
    <div class="reset-button">
      <button class="reset">Play Again?</button>
    </div>
    <div class="dealer-hand-container"></div>
    <div class="player-hand-container"></div>
    <div class="buttons"><button class="hit-button">Hit</button>
      <button class="stand-button">Stand</button>
    </div>
  '

  events:
    # 'click .hit-button': -> @model.get('playerHand').hit()
    # 'click .stand-button': -> @model.get('playerHand').stand()
    'click .hit-button': -> @playerHandView.hit()
    'click .stand-button': ->
      @dealerHandView.stand()
      @model.compareScores()

  initialize: ->
    @playerHandView = new HandView(collection: @model.get 'playerHand')
    @dealerHandView = new HandView(collection: @model.get 'dealerHand')
    @model.on 'win', ->
      $('.result').html('<h1 class="win">You win!</h1 >')
      $('.buttons').hide()
      $('.reset-button').show()
    @model.on 'lose', ->
      $('.result').html('<h1 class="lose">You lose!</h1 >')
      $('.buttons').hide()
      $('.reset-button').show()
    @model.on 'tie', ->
      $('.result').html('<h1 class="tie">You tie!</h1 >')
      $('.buttons').hide()
      $('.reset-button').show()
    @model.on 'printBust', ->
      $('.result').html('<h1 class="lose">You lose!</h1 >')
      $('.buttons').hide()
      $('.reset-button').show()
    @render()


  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html @playerHandView.el
    @$('.dealer-hand-container').html @dealerHandView.el

