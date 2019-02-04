from tkinter import *

class EnemyGUI:
    
    def __init__(self,master,num):
        
        self.num = num
        self.c1 = "none"
        self.c2 = "none"
        self.bet = 0
        self.frame = Frame(master)
        self.chips = 100
        self.active = True
        self.alive = True
        self.allIn = False
        
        self.photo = PhotoImage(file="images/other/back.png")
        self.card1 = Label(self.frame, image=self.photo)
        self.card1.image = self.photo
        self.card2 = Label(self.frame, image=self.photo)
        self.card1.image = self.photo
        self.mLabel = Label(self.frame, text="Money: ")
        self.bLabel = Label(self.frame, text="Bet: ")
        
        self.card1.grid(row=0)
        self.card2.grid(row=0,column=1)
        self.mLabel.grid(row=1)
        self.bLabel.grid(row=1,column=1)
        
        
    def updateDis(self):
        #updates the chips and bets value
        self.mLabel.configure(text="Money: " + str(self.chips))
        self.bLabel.configure(text="Bet: " + str(self.bet))
        
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