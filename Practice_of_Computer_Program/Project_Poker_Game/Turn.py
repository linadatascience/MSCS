from random import *

class Turn:
    def __init__(self,master,player):
        self.master = master
        self.player = player
        self.master.master.master.ui.status = self.master.master.stage + ": Player " + str(self.player.num)            
        self.master.master.master.upVisuals()
          
        if player.num == 1:
            if self.master.master.betting:
                self.player.betB.grid_forget()
                self.player.checkB.grid_forget()
                self.player.foldB.grid(row=2)
                self.player.callB.grid(row=0)
                self.player.raiseB.grid(row=1)
                player.foldB.configure(command=self.foldA)
                player.callB.configure(command=self.callA)
                player.raiseB.configure(command=self.raiseA)
            else:
                self.player.betB.grid(row=1)
                self.player.checkB.grid(row=0)
                self.player.foldB.grid(row=2)
                self.player.callB.grid_forget()
                self.player.raiseB.grid_forget()
                player.foldB.configure(command=self.foldA)
                player.checkB.configure(command=self.checkA)
                player.betB.configure(command=self.betA)
            self.master.master.master.upVisuals()
        else:
            self.enemyTurn()
            
            
    #does everything to have the player fold out of the round
    def foldA(self):
        print("Player " + str(self.player.num) + " folds")
        self.master.master.playerFolds(self.player.num)
        self.master.pCount += 1
        if self.player.num == 1:
            self.unconfigure()
        self.master.master.master.upVisuals()
        self.master.makeNewTurn()
        
    #does everything to have the player bet an amount of chips
    def betA(self):
        if self.player.num == 1:
            if self.player.bEntry.get() == "":
                print("Please enter something")
            else:
                x = int(self.player.bEntry.get())
                self.betCont(x)
        else:
            x = randint(1,3) * self.master.master.master.bbValue
            self.betCont(x)
    
    #does everything to have the player raise
    def raiseA(self):
        if self.player.num == 1:
            if self.player.bEntry.get() == "":
                print("Please enter something")
            else:
                x = int(self.player.bEntry.get())
                self.betCont(self.master.master.betCeil + x)
        else:
            x = randint(1,3) * self.master.master.master.bbValue
            self.betCont(self.master.master.betCeil + x)
    
    #does everything to have the player call
    def callA(self):
        print("Player " + str(self.player.num) + " calls")
        self.player.bet = self.master.master.master.takeChips(self.player,self.master.master.betCeil)
        self.master.pCount += 1
        if self.player.num == 1:
            self.unconfigure()
        self.master.master.master.upVisuals()
        self.master.makeNewTurn()
            
    #does everything to have the player check
    def checkA(self):
        print("Player " + str(self.player.num) + " checks")
        self.master.pCount += 1
        if self.player.num == 1:
            self.unconfigure()
        self.master.master.master.upVisuals()
        self.master.makeNewTurn()
    
    #makes it so the player's buttons do nothing
    def unconfigure(self):
        self.player.foldB.configure(command=self.doNothing)
        self.player.callB.configure(command=self.doNothing)
        self.player.checkB.configure(command=self.doNothing)
        self.player.raiseB.configure(command=self.doNothing)
        self.player.betB.configure(command=self.doNothing)
        
    #placeholder for a pass argument
    def doNothing(self):
        pass
    
    def enemyTurn(self):
        if self.master.master.betting:
            x = randint(0,2)
            if x == 0:
                self.master.master.master.ui.root.after(500,self.foldA)
            elif x == 1:
                self.master.master.master.ui.root.after(500,self.callA)
            elif x == 2:
                self.master.master.master.ui.root.after(500,self.raiseA)
        else:
            x = randint(0,2)
            if x == 0:
                self.master.master.master.ui.root.after(500,self.foldA)
            elif x == 1:
                self.master.master.master.ui.root.after(500,self.checkA)
            elif x == 2:
                self.master.master.master.ui.root.after(500,self.betA)
                
    def betCont(self,x):
        self.player.bet += self.master.master.master.takeChips(self.player,x)
        self.master.master.betting = True
        y = 0
        length = len(self.master.master.players)
        for z in range(length):
            if self.master.master.players[z].num == self.player.num:
                y = z
        self.master.master.betStart = self.master.master.master.safeIncrease(y,self.master.master.players)
        if self.player.num == 1:
            self.unconfigure()
        print("Player " + str(self.player.num) + " bets " + str(x))
        self.master.master.betCeil = x
        self.master.master.master.upVisuals()
        self.master.master.createNewCycle()