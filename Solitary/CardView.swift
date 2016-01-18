//
//  CardView.swift
//  Solitary
//
//  Created by Sam Tipton on 1/6/16.
//  Copyright © 2016 samtipton. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    internal static let CARD_WIDTH:CGFloat = 70
    internal static let CARD_HEIGHT:CGFloat = 1.4 * CardView.CARD_WIDTH

    var _card:Card?
    var lastLocation:CGPoint = CGPointMake(0, 0)
    
    override init(frame: CGRect) {
        _card = Card(rank: Card.Rank.Ace, suit: Card.Suit.Spade)
        super.init(frame: frame)
        
        let panRecognizer = UIPanGestureRecognizer(target: self, action: "detectPan:")
        self.gestureRecognizers = [panRecognizer]
        
        self.lastLocation = self.center
        self.backgroundColor = UIColor.clearColor()
    }
    
    convenience init(frame:CGRect, card: Card) {
        self.init(frame:frame)
        _card = card
    }

    required init?(coder aDecoder: NSCoder) {
        self._card = nil
        super.init(coder: aDecoder)
    }
    
    func detectPan(recognizer:UIPanGestureRecognizer) {
        let translation  = recognizer.translationInView(self.superview!)
        self.center = CGPointMake(lastLocation.x + translation.x, lastLocation.y + translation.y)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        // Promote the touched view
        self.superview?.bringSubviewToFront(self)
        
        // Remember original location
        self.lastLocation = self.center
    }
    
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {

        let cardPath = UIBezierPath(roundedRect:
            CGRectMake(0, 0, CardView.CARD_WIDTH, CardView.CARD_HEIGHT),
            cornerRadius: 5)
        
        UIColor.whiteColor().setFill()
        cardPath.fill()
        
        let font = UIFont(name: "Courier", size: 14)
        let attributes = [NSFontAttributeName: font!]
        
        let rank = self._card!.rank.symbol()
        let rankRect = CGRectMake(4, 3, 20, 25)
        rank.drawInRect(rankRect, withAttributes: attributes)
        
        let suit = self._card!.suit.symbol()
        let suitRect = CGRectMake(0, 20, 20, 25)
        let suitFont = UIFont(name: "Courier", size: 12)
        let suitAttributes = [NSFontAttributeName: suitFont!]
        suit.drawInRect(suitRect, withAttributes: suitAttributes)
        
    }
}
