from Card import *
from random import shuffle

class Deck:
    def __init__(self):
        
        self.deck = []
        suit = "spades"
        
        for x in range (1,14):
            self.deck.append(Card(suit,x))
            
        suit = "clubs"
        
        for x in range (1,14):
            self.deck.append(Card(suit,x))
        
        suit = "hearts"
        
        for x in range (1,14):
            self.deck.append(Card(suit,x))
            
        suit = "diamonds"
        
        for x in range (1,14):
            self.deck.append(Card(suit,x))
               
            
    def shuffle(self):
        shuffle(self.deck)