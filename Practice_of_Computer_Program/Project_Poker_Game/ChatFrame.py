from tkinter import *

class ChatGUI:
    
    def __init__(self,master):
        self.frame = Frame(master,height=100,width=300)
        self.frame.pack_propagate(0)
        
        self.messages = Text(self.frame)
        self.messages.pack()
        
        self.userI = StringVar()
        self.inputF = Entry(self.frame,text=self.userI)
        self.inputF.pack(side=BOTTOM,fill=X)
        
        
    def EnterPressed(event):
        self.getI = self.inputF.get()
        self.messages.insert(INSERT, '%s\n' % self.getI)
        self.userI.set('')
        return "break"
    
    
        