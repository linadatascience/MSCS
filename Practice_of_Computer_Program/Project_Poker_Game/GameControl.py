from UiWindow import *
from Round import *
from tkinter import *
from tkinter.messagebox import showinfo

class Game:
    
    def __init__(self,ui):
        #this makes the update button
        ui.makeUpdate(self)
        
        #sets up the list of players
        self.pframes = []
        self.pframes.append(ui.mainP)
        self.pframes.append(ui.p2)
        self.pframes.append(ui.p3)
        self.pframes.append(ui.p4)
        self.pframes.append(ui.p5)
        self.pframes.append(ui.p6)
        self.pframes.append(ui.p7)
        self.pframes.append(ui.p8)
        
        length = len(self.pframes)
        self.alivePs = []
        for x in range(length):
            self.alivePs.append(self.pframes[x])
        
        #gets other references
        self.ui = ui
        self.center = ui.center
        self.bbPlayer = 7
        self.bbValue = 5
        self.ui.center.bigB = self.bbValue
        self.round = Round(self,self.pframes)
        
        
    #updates all the visuals going on in the UI
    def upVisuals(self):
        for x in range(len(self.pframes)):
            self.pframes[x].updateDis()
        self.center.updateDis()
        self.ui.updateDis()
    
    def findDeadPlayers(self):
        end = False
        x = 0
        while end == False:
            if self.pframes[x].chips <= 0:
                self.killPlayer(self.pframes[x].num)
            if x >= len(self.pframes)-1:
                end = True
            else:
                x += 1
        
        self.upVisuals()
    
    #kicks any player from the game that has no chips
    def killPlayer(self,pnum):
        aLength = len(self.alivePs)
        
        for x in range(aLength):
            if self.alivePs[x].num == pnum:
                print("Player " + str(pnum) + " has lost all their chips.")
                
                if x < self.bbPlayer and not self.bbPlayer == 0:
                    self.bbPlayer -= 1
                elif x == self.bbPlayer and self.bbPlayer > len(self.alivePs):
                    self.bbPlayer -= 1
                self.alivePs[x].alive = False
                del self.alivePs[x]
                break
    #makes it so that increasing a number won't throw an error
    def safeIncrease(self,num,l):
        if num + 1 >= len(l):
            num = 0
        else:
            num += 1
            
        return num
    
    #takes chips away from a player without going below zero 
    def takeChips(self,player,num):
        bet = 0
        if num > player.chips:
            bet += player.chips
            player.chips = 0
            return bet
        else:
            bet += num
            player.chips -= num
            return bet
    
    #ups the bigblind and moves it to another player
    def createNewRound(self):
        if len(self.alivePs) == 1:
            print ("Player " + str(self.alivePs[0].num) + " wins!")
            self.ui.root.destroy()
        else:
            self.bbValue += 5
            self.ui.center.bigB = self.bbValue
            self.bbPlayer = self.safeIncrease(self.bbPlayer,self.pframes)
            self.round = Round(self,self.pframes)
        
    
            
#main line of code
ui = MainUI()
g = Game(ui)
ui.root.mainloop()