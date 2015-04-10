# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    thiz = @
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'bust', ->
      thiz.trigger('printBust', thiz)
      console.log(thiz)

  compareScores: ->
    dealerScore = @get('dealerHand').scores()
    playerScore = @get('playerHand').scores()
    if playerScore[0] > 21
      @trigger('lose', @)
    else
      if playerScore[1] > 21
        playerScore = playerScore[0]
      else
        playerScore = playerScore[1]
      if dealerScore[1] > 21
        dealerScore = dealerScore[0]
      else
        dealerScore = dealerScore[1]
      if dealerScore == playerScore
        @trigger('tie', @)
      else if dealerScore > 21 or (21 - playerScore) < (21 - dealerScore)
        @trigger('win', @)
      else @trigger('lose', @)
