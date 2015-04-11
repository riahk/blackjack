assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  it 'should be initialized with 52 cards', ->
    deck = new Deck()
    assert.strictEqual deck.length, 52

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 50
      last = deck.last()
      hand.hit()
      assert.strictEqual last, hand.last()
      assert.strictEqual deck.length, 49
