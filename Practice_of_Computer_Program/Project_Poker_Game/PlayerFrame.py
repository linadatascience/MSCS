from tkinter import *
from Card import *

class PlayerGUI:
    
    def __init__(self,master,num):
        
        #holds Hard variables
        self.num = num
        self.frame = Frame(master)        
        self.c1 = "none"
        self.c2 = "none"
        self.chips = 100
        self.bet = 0
        self.active = True
        self.alive = True
        self.allIn = False
        
        #creates and sets up the UI elements
        self.photo = PhotoImage(file="images/spades/2.png")
        self.cardFrame = Frame(self.frame)
        self.buttFrame = Frame(self.frame)
        self.card1 = Label(self.cardFrame, image=self.photo)
        self.card1.image = self.photo
        self.card2 = Label(self.cardFrame, image=self.photo)
        self.card2.image = self.photo
        self.mLabel = Label(self.buttFrame, text="Money: ")
        self.foldB = Button(self.buttFrame,text="Fold")
        self.betB = Button(self.buttFrame,text="Bet")
        self.checkB = Button(self.buttFrame,text="Check")
        self.raiseB = Button(self.buttFrame,text="Raise")
        self.callB = Button(self.buttFrame,text="Call")
        self.bEntry = Entry(self.buttFrame,text="")
        self.bLabel = Label(self.buttFrame,text="Bet: ")
        
        #sets up the location of the UI elements
        self.cardFrame.pack(side=LEFT)
        self.buttFrame.pack(side=RIGHT)
        self.card1.pack(side=LEFT)
        self.card2.pack(side=LEFT)
        self.mLabel.grid(row=2,column=1)
        self.foldB.grid(row=2)
        self.betB.grid(row=1)
        self.checkB.grid(row=2)
        self.raiseB.grid(row=1)
        self.callB.grid(row=0)        
        self.bEntry.grid(row=1,column=1)
        self.bLabel.grid(row=0,column=1)
            
    def updateDis(self):
        
        #updates the chips and bets value
        self.mLabel.configure(text="Money: " + str(self.chips))
        self.bLabel.configure(text="Bet: " + str(self.bet))
        
        #makes sure that the player is still in the game
        if self.alive == False:
            fileName = "images/blank.png"
            photo = PhotoImage(file=fileName)
            
            self.card1.configure(image=photo)
            self.card1.image = photo
            self.card2.configure(image=photo)
            self.card2.image = photo
        else:
            #makes sure that there are cards to show
            if (self.c1 == "none" and self.c2 == "none") or self.active == False:
                fileName = "images/transparent.png"
                photo = PhotoImage(file=fileName)
                
                self.card1.configure(image=photo)
                self.card1.image = photo
                self.card2.configure(image=photo)
                self.card2.image = photo
            else:
                #checks to make sure the cards are hidden or not
                if self.c1.vis == True:
                    fileName = "images/" + self.c1.suit + "/" + self.c1.rank + ".png"
                else:
                    fileName = "images/back.png"
                    
                photo = PhotoImage(file=fileName)            
                self.card1.configure(image=photo)
                self.card1.image = photo
                
                if self.c2.vis == True:
                    fileName = "images/" + self.c2.suit + "/" + self.c2.rank + ".png"
                else:
                    fileName = "images/back.png"
                    
                photo = PhotoImage(file=fileName)    
                self.card2.configure(image=photo)
                self.card2.image = photo