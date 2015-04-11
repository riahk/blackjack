assert = chai.assert

describe "deck constructor", ->

  it "should create a card collection", ->
    collection = new Deck()
    assert.strictEqual collection.length, 52

describe "flip", ->

  it "should return card it was called on", ->
    collection = new Deck()
    card = collection.pop()
    assert.strictEqual card, card.flip()

  it "should flip the card", ->
    collection = new Deck()
    card = collection.pop()
    before = card.get('revealed')
    card.flip()
    assert.strictEqual card.get('revealed'), !before
