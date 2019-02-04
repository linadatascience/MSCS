from Turn import *

class Cycle:
    def __init__(self,master,actives):
        self.master = master
        self.pCount = master.betStart
        self.players = []
        print("New cycle made")
        length = len(actives)
        for x in range(length):
            if x + self.pCount >= length:
                self.players.append(actives[x-(length-self.pCount)])
            else:
                self.players.append(actives[x+self.pCount])
        self.pCount = 0
        self.t = Turn(self,self.players[self.pCount])
        
    def makeNewTurn(self):
        if (self.pCount < len(self.players)) and (len(self.master.players)) > 1:
            self.t = Turn(self,self.players[self.pCount])
        else:
            self.master.master.ui.root.after(500,self.master.createNewCycle())