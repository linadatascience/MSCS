#this program is used to calculate the BMI)(body mass index) for the people more than 18 years old
#based on the weight, age, height, the calculate BMI is used to indicate if the test person is overweight or not


class bodyMassIndex:
    
    def setArguments(self, weight, height):
        self.weight=weight*0.454    #convert the weight in pounds to kilograms
        self.height=height*0.3048   #convert the height in feet to that in meters 

    def getBMI(self): #calculate the BMI based on person's weight and height
        self.BMI=round(self.weight/(self.height**2),1)
        print('the BMI is:', self.BMI)
        return self.BMI


    def getStatus(self):    # decide person's obesity status based on calculated BMI
        if self.BMI < 18.5:
            self.status='Underweight'
            
        elif self.BMI<=24.9:
            self.status='Normal'
            
        elif self.BMI<=29.9:
            self.status='Overweight'
            
        else :
            self.status='Obese'

        return self.status   
    
