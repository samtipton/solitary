//
//  Card.swift
//  Solitary
//
//  Created by Sam Tipton on 1/6/16.
//  Copyright © 2016 samtipton. All rights reserved.
//

import Darwin

class Card {
    enum Suit: UInt32 {
        
        private static let _count: UInt32 = 4
        
        case Club = 0
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
        
        static func enumerate () -> [Suit] {
            return [Club, Diamond, Heart, Spade]
        }
        
        internal static func randomSuit() -> Suit {
            // pick and return a new value
            let rand = arc4random_uniform(_count)
            return Suit(rawValue: rand)!
        }
        
        func equal(rhs:Suit) -> Bool {
            return self.rawValue == rhs.rawValue
        }
        
        
    }
    
    enum Rank: UInt32 {
        
        private static let _count: UInt32 = 13
        
        case Ace = 0
        case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Jack, Queen, King
        
        func symbol() -> String {
            switch self {
            case .Ace:
                return "A"
            case .Jack:
                return "J"
            case .Queen:
                return "Q"
            case .King:
                return "K"
            default:
                return String(self.rawValue + 1)
            }
        }
        
        static func enumerate () -> [Rank] {
            return [Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King ]
        }
    
        internal static func randomRank() -> Rank {
            // pick and return a new value
            let rand = arc4random_uniform(_count)
            return Rank(rawValue: rand)!
        }
        
        func equal(rhs: Rank) -> Bool {
            return self.rawValue == rhs.rawValue
        }
    }
    
    var rank: Rank
    var suit: Suit
    
    init(rank: Rank, suit: Suit) {
        self.rank = rank
        self.suit = suit
    }
}

func +(left:Card.Rank, right:UInt32) -> Card.Rank {
    return Card.Rank(rawValue: left.rawValue + right)!
}