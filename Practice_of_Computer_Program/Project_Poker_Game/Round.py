from Deck import *
from Cycle import *
from random import *

class Round:
    
    def __init__(self,master,actives):
        
        self.master = master
        #gets the deck
        self.d = Deck()
        self.d.shuffle()
        self.players = []
        self.bHeight = self.master.bbValue
        length = len(actives)
        for x in range(length):
            if actives[x].alive == True:
                actives[x].active = True
                self.players.append(actives[x])
        print("New round made")
        
        #Deals cards to all the players
        arrayLength = len(actives)
        for x in range(arrayLength):
            actives[x].c1 = self.d.deck[x]
            if x > 0:
                master.pframes[x].c1.vis = False
            
        for x in range(arrayLength):
            master.pframes[x].c2 = self.d.deck[x + arrayLength]
            if x > 0:
                master.pframes[x].c2.vis = False
                
        #Reset the center
        self.master.center.c1 = "none"
        self.master.center.c2 = "none"
        self.master.center.c3 = "none"
        self.master.center.c4 = "none"
        self.master.center.c5 = "none"
                
        #saves the spot in the deck and resets pot
        self.dCount = arrayLength*2
        master.center.pot = 0
        
        #gets the bigblind from the bbplayer
        if len(self.players) <= self.master.bbPlayer:
            self.master.bbPlayer = len(self.players) - 1
        master.center.pot += self.master.takeChips(self.players[self.master.bbPlayer],self.master.bbValue)
        
        #set the stage and the buttons for that stage
        self.stage = "PreFlop"
        self.betting = True
        self.betCeil = 0
        self.betCeil += self.master.bbValue
        self.betStart = master.safeIncrease(master.bbPlayer,self.players)
        
        
        #creates the Cycle
        self.cy = Cycle(self,self.players)
        
        #this deals out the flop
        """master.center.c1 = self.d.deck[self.arrayLength*2 + 1]
        master.center.c2 = self.d.deck[self.arrayLength*2 + 2]
        master.center.c3 = self.d.deck[self.arrayLength*2 + 3]"""
    
    def increaseStage(self):
        self.betting = False
        if self.stage == "PreFlop":
            self.stage = "Flop"
            self.master.center.c1 = self.d.deck[self.dCount + 1]
            self.master.center.c2 = self.d.deck[self.dCount + 2]
            self.master.center.c3 = self.d.deck[self.dCount + 3]
        elif self.stage == "Flop":
            self.stage = "Turn"
            self.master.center.c4 = self.d.deck[self.dCount + 4]
        elif self.stage == "Turn":
            self.stage = "River"
            self.master.center.c5 = self.d.deck[self.dCount + 5]
            
    
    def playerFolds (self,pnum):
        aLength = len(self.players)
        
        for x in range(aLength):
            if self.players[x].num == pnum:
                if x < self.betStart and not self.betStart == 0:
                    self.betStart -= 1
                elif x == self.betStart and self.betStart > len(self.players):
                    self.betStart -= 1
                self.players[x].active = False
                del self.players[x]
                self.master.upVisuals()
                break
        
    def createNewCycle (self):
        length = len(self.cy.players)
        for x in range(0,length):
            self.master.center.pot += self.cy.players[x].bet
            self.cy.players[x].bet = 0
        if len(self.players) > 1:
            if self.cy.pCount >= len(self.cy.players):
                if self.stage == "River":
                    x = randint(0,len(self.players)-1)
                    self.players[x].chips += self.master.center.pot
                self.betCeil = 0
                self.increaseStage()
                
            self.cy = Cycle(self,self.players)
        else:
            self.players[0].chips += self.master.center.pot
            self.master.findDeadPlayers()
            self.master.createNewRound()
            