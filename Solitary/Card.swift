//
//  Card.swift
//  Solitary
//
//  Created by Sam Tipton on 1/6/16.
//  Copyright © 2016 samtipton. All rights reserved.
//

class Card {
    enum Suit: Int {
        case Club = 1
        case Diamond, Heart, Spade
        func symbol () -> String {
            switch self {
            case .Club:
                return "♣️"
            case .Diamond:
                return "♦️"
            case .Heart:
                return "♥️"
            case .Spade:
                return "♠️"
            }
        }
        func equal(rhs:Suit) -> Bool {
            return self.rawValue == rhs.rawValue
        }
    }
    
    enum Rank: Int {
        case Ace = 1
        case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Jack, Queen, King
        func simpleDescription() -> String {
            switch self {
            case .Ace:
                return "ace"
            case .Jack:
                return "jack"
            case .Queen:
                return "queen"
            case .King:
                return "king"
            default:
                return String(self.rawValue)
            }
        }
        func equal(rhs: Rank) -> Bool {
            return self.rawValue == rhs.rawValue
        }
    }
    
    var _rank: Rank
    var _suit: Suit
    
    init(rank: Rank, suit: Suit) {
        _rank = rank
        _suit = suit
    }
}