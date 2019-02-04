from tkinter import *
from CommFrame import CommGUI
from EnemyFrame import EnemyGUI
from PlayerFrame import PlayerGUI
from ChatFrame import *
from Card import *

class MainUI:

    def __init__(self):
        #sets up hard variables
        self.root = Toplevel()
        self.root.title("Poker Game")
        self.gameObj = None
              
        #creates and assigns ui elements
        self.p2 = EnemyGUI(self.root,2)
        self.p3 = EnemyGUI(self.root,3)
        self.p4 = EnemyGUI(self.root,4)
        self.p5 = EnemyGUI(self.root,5)
        self.p6 = EnemyGUI(self.root,6)
        self.p7 = EnemyGUI(self.root,7)
        self.p8 = EnemyGUI(self.root,8)
        self.mainP = PlayerGUI(self.root,1)
        self.center = CommGUI(self.root)
        self.quitB = Button(self.root,text="Close Game",command=self.root.destroy)
        self.chat = ChatGUI(self.root)
        
        #formats where the above ui elements will be placed
        self.p2.frame.grid(row=2,column=0,padx=10)
        self.p3.frame.grid(row=1,column=0,padx=10)
        self.p4.frame.grid(row=0,column=1,padx=10)
        self.p5.frame.grid(row=0,column=2,padx=10)
        self.p6.frame.grid(row=0,column=3,padx=10)
        self.p7.frame.grid(row=1,column=4,padx=10)
        self.p8.frame.grid(row=2,column=4,padx=10)
        self.mainP.frame.grid(row=3,column=2,columnspan=3,padx=10)
        self.center.frame.grid(row=1,column=1,columnspan=3,rowspan=2,padx=10)
        self.quitB.grid(row=0,column=4)
        self.chat.frame.grid(row=3,column=0,columnspan=2,padx=10)
    
    #makes the update button and ties it to the game controller
    def makeUpdate(self,master):
        self.gameObj = master
        self.status = "Start" #will start at the default
        self.upFrame = Frame(self.root)
        self.update = Button(self.upFrame,text="Update Game")
        self.statL = Label (self.upFrame,text="Status: " + self.status)
        self.upFrame.grid(row=0,column=0)
        self.update.pack(side=BOTTOM)
        self.statL.pack(side=TOP)
        
    def updateDis(self):
        #might add more in her butt its all set for now
        self.statL.configure(text="Status: " + self.status)
