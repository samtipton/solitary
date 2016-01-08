//
//  CardPile.swift
//  Solitary
//
//  Created by Sam Tipton on 1/6/16.
//  Copyright © 2016 samtipton. All rights reserved.
//

protocol PlayablePile {
    func addCard(card:Card) -> Bool
    func addCards(cards:[Card]) -> Bool
    func takeCard() -> Card
    func takeTopCards(n: Int) -> [Card]
    func count () -> Int
}

class BasePile : PlayablePile {
    var _cards: [Card] = []
    
    internal init() {}
    
    func addCard(card:Card) -> Bool {
        return false
    }
    func addCards(cards:[Card]) -> Bool {
        return false
    }
    func takeCard() -> Card {
        return _cards.removeLast()
    }
    func takeTopCards(n: Int) -> [Card] {
        let top = [Card](_cards[n..<_cards.count])
        _cards.removeRange(n..._cards.count - 1)
        return top
    }
    func count () -> Int {
        return _cards.count
    }
}

class StockPile : BasePile {
    
}

class WastePile : BasePile {
    
}

class TableauPile : BasePile {
    
}

class FoundationPile : BasePile {
    
}
