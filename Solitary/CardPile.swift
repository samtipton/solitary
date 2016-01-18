//
//  CardPile.swift
//  Solitary
//
//  Created by Sam Tipton on 1/6/16.
//  Copyright © 2016 samtipton. All rights reserved.
//

import Darwin

protocol SolitaireCardPile {
    func canAccept(cards:CardPile) -> Bool
}

extension Array {
    func shuffled() -> [Element] {
        if count < 2 { return self }
        var list = self
        for i in 0..<(list.count - 1) {
            let j = Int(arc4random_uniform(UInt32(list.count - i))) + i
            if( i != j) {
                swap(&list[i], &list[j])
            }
        }
        return list
    }
}

class CardPile {
    var cards:Array<Card> = []
    
    func first () -> Card {
        return cards.first!
    }
    
    func last () -> Card {
        return cards.last!
    }
    
    subscript(n:Int) -> CardPile {
        get {
            let p = CardPile()
            
            for card in self.cards[n...cards.count] {
                p.cards.append(card)
            }
            cards.removeRange(n...cards.count)
            return p
            
        }
        set {
            for card in newValue.cards {
                cards.append(card)
            }
        }
    }
}

class StockPile : CardPile {
    
}

class WastePile : CardPile {

}

class TableauPile : CardPile, SolitaireCardPile {
    func canAccept(pile: CardPile) -> Bool {
        return pile.first().rank == last().rank + 1
    }
}

class FoundationPile : CardPile, SolitaireCardPile {
    var suit:Card.Suit
    
    init(suit:Card.Suit) {
        self.suit = suit
    }
    
    func canAccept(pile: CardPile) -> Bool {
        return self.suit == pile.first().suit &&
            pile.first().rank == last().rank + 1
    }
}
