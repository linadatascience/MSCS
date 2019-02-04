from tkinter import *

class CommGUI:
    
    def __init__(self,master):
        self.frame = Frame(master)
        
        self.c1 = "none"
        self.c2 = "none"
        self.c3 = "none"
        self.c4 = "none"
        self.c5 = "none"
        self.pot = 0
        self.bigB = 1
        self.photo = PhotoImage(file="images/back.png")
        self.cardFrame = Frame(self.frame)
        self.infoFrame = Frame(self.frame)
        self.card1 = Label(self.cardFrame, image=self.photo)
        self.card1.image = self.photo
        self.card2 = Label(self.cardFrame, image=self.photo)
        self.card2.image = self.photo
        self.card3 = Label(self.cardFrame, image=self.photo)
        self.card3.image = self.photo
        self.card4 = Label(self.cardFrame, image=self.photo)
        self.card4.image = self.photo
        self.card5 = Label(self.cardFrame, image=self.photo)
        self.card5.image = self.photo
        self.potLabel = Label(self.infoFrame, text="Pot: 300$")
        self.bigBLabel = Label(self.infoFrame, text="Big Blind: ")
        
        
        self.cardFrame.pack(side=TOP)
        self.infoFrame.pack(side=BOTTOM)
        self.card1.pack(side=LEFT)
        self.card2.pack(side=LEFT)
        self.card3.pack(side=LEFT)
        self.card4.pack(side=LEFT)
        self.card5.pack(side=LEFT)
        self.potLabel.pack(side=LEFT)
        self.bigBLabel.pack(side=LEFT)
        
    def updateDis(self):
        
        #checks each card variable, if none then trans is displayed
        #card1
        if self.c1 == "none":
            fileName = "images/transparent.png"
        else:
            fileName = "images/" + self.c1.suit + "/" + self.c1.rank + ".png"
            
        photo = PhotoImage(file=fileName)
        self.card1.configure(image=photo)
        self.card1.image = photo
        
        #card2
        if self.c2 == "none":
            fileName = "images/transparent.png"            
        else:
            fileName = "images/" + self.c2.suit + "/" + self.c2.rank + ".png"
            
        photo = PhotoImage(file=fileName)
        self.card2.configure(image=photo)
        self.card2.image = photo
        
        #card3
        if self.c3 == "none":
            fileName = "images/transparent.png"            
        else:
            fileName = "images/" + self.c3.suit + "/" + self.c3.rank + ".png"
            
        photo = PhotoImage(file=fileName)
        self.card3.configure(image=photo)
        self.card3.image = photo
        
        #card4
        if self.c4 == "none":
            fileName = "images/transparent.png"            
        else:
            fileName = "images/" + self.c4.suit + "/" + self.c4.rank + ".png"
            
        photo = PhotoImage(file=fileName)
        self.card4.configure(image=photo)
        self.card4.image = photo
        
        #card5
        if self.c5 == "none":
            fileName = "images/transparent.png"            
        else:
            fileName = "images/" + self.c5.suit + "/" + self.c5.rank + ".png"
            
        photo = PhotoImage(file=fileName)
        self.card5.configure(image=photo)
        self.card5.image = photo
        
        #changes the pot label to match its variable
        self.potLabel.configure(text="Pot: " + str(self.pot))
        
        #changes the big blind label to match the variable
        self.bigBLabel.configure(text="Big Blind: " + str(self.bigB))