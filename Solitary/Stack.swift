//
//  Stack.swift
//  Solitary
//
//  Created by Sam Tipton on 1/6/16.
//  Copyright © 2016 samtipton. All rights reserved.
//

class Stack<T> {
    var _c = [T]()
    
    init(cards: [T]) {
        _c = cards
    }
    
    func push(item: T) {
        _c.append(item)
    }
    func pop(item: T) -> T? {
        if size() > 0 {
            return _c.removeLast()
        }
        else {
            return nil
        }
    }
    func size() -> Int {
        return _c.count
    }
    func reverse() -> Stack<T> {
        return Stack<T>(_c.reverse())
    }
}