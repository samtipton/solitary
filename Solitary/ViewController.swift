//
//  ViewController.swift
//  Solitary
//
//  Created by Sam Tipton on 1/6/16.
//  Copyright © 2016 samtipton. All rights reserved.
//

import UIKit

protocol DragAndDropDelegate {
    func onbeginDrag(card:CardView)
    func onDrag(card:CardView)
    func onDrop(card:CardView)
}

class ViewController: UIViewController, DragAndDropDelegate {
    
    private var cards:Array<Card> = []
    private var cardViews:Array<CardView> = []
    
    private let stockPile:CardPile = StockPile()
    private let wastePile:CardPile = WastePile()
    private let foundationPiles:Array<FoundationPile> = [FoundationPile(suit: Card.Suit.Club),
        FoundationPile(suit: Card.Suit.Diamond),FoundationPile(suit: Card.Suit.Heart),
        FoundationPile(suit: Card.Suit.Spade)]
    
    private let tableauPiles:Array<TableauPile> = [TableauPile(), TableauPile(), TableauPile(), TableauPile(), TableauPile(), TableauPile(), TableauPile()]
    
    
    private var selectedCard:CardView?
    
    private var next:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    override func loadView() {
        super.loadView()
        
        initBoard()
        initCards()
        initCardPiles()
        dealCards()
    }
    
    func inspectNearbyCards() {
        
    }
    
    func onbeginDrag(card: CardView) {
        selectedCard = card
    }
    
    func onDrag(card: CardView) {
        inspectNearbyCards()
    }
    
    func onDrop(card: CardView) {
        
    }
    
    func dealCards() {

    }
    
    func initCardPiles() {
        
    }
    
    func initCards() {
        for arank in Card.Rank.enumerate() {
            for asuit in Card.Suit.enumerate() {
                cards.append(Card(rank: arank, suit: asuit))
            }
        }
        cards = cards.shuffled()
    }
    
    func initBoard() {
        _ = BoardView(frame:CGRect(x:0, y:0,
            width:self.view.frame.width,
            height:self.view.frame.height))
    }
    
    @IBAction func boardTap(gesture:UITapGestureRecognizer?) {
        
        let location = gesture?.locationInView(self.view)
       
        let card = CardView(frame: CGRect(x: location!.x - CardView.CARD_WIDTH / 2,
                                          y: location!.y - CardView.CARD_HEIGHT / 2,
                                          width: CardView.CARD_WIDTH,
                                          height: CardView.CARD_HEIGHT),
            card: cards[next++ % 52])
        self.view.addSubview(card)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

