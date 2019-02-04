# this program is used to test BMI calculation


from bmi import bodyMassIndex
#import InteractiveConsole


    
def healthStatus(name, age, weight, height):   #define a function to take the parameters and construct object of defined bodyMassIndex class 
    test_object=bodyMassIndex()     #creat an instance of class bodyMassIndex
    test_object.setArguments(weight, height)  # pass the parameter of 'weight' and 'height' to the variables of object 'test_object'
    test_object.getBMI()    #calculate the BMI for object 'test_object'
    status=test_object.getStatus()   # decide the value of attribute 'status' of object 'test_object'
    print('%s'%name,'\'s health status is',str(status))
    return

print('Please input the test person\'s name:', end='')    #provide a prompt to ask user to enter necessary arguments, such name, age, weight
                                                        #and height, and check the validation of parameter 'age'
Name=input()
    
valid_age=False
while valid_age==False:
      print('Please input the test person\'s age:', end='')
      Age=int(input())
      if Age<16:
         print('the age of person is not applied to BMI!')
      else:
         valid_age=True
         break
print('Please input the test person\'s weight in pounds:', end='')
Weight=float(input())

print('Please input the test person\'s height in feet:', end='')
Height=float(input())

healthStatus(Name, Age, Weight, Height)
raw_input("Press <enter>")    
   
    
