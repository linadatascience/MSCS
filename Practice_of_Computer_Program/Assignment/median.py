#this program is used to ask user to give the median number of five two digits
#which are randomly generated and sorted in increasig sequence

import random
playTest=True
while playTest==True:
    while True:
        noDuplicate=True
        listTest=[]
        for n in range(0,5):            #randomly generate five two-digits numbers and store them in a list
            listTest.append(random.randrange(10,100))
        listTest.sort()                 #sort the numbers of list in increasing sequence
        for m in range(0,4):            #check if there are duplicate numbers in the list, if there are, then generate a new list of five two-digits numbers
            for p in range(m+1,5):
                if listTest[m]==listTest[p]:
                    noDuplicate=False
        if noDuplicate==True:
            break
        else:
            continue     
    tryNum=0
    tryAgain=True
    while tryAgain==True:
        print('What is the median of these numbers:',listTest[0],',', listTest[1],',',listTest[2],',',listTest[3],'and',listTest[4],':',end='')
        ans=int(input())
        if ans==listTest[2]:
           print('Your answer is correct. Do you want to play again?(Y/N):', end='')
           playAgain=str(input())
           if playAgain=='N':
              playTest=False
           if playAgain=='Y':
              playTest=True
           break
        elif ans!=listTest[2] and tryNum==0:
           print('Your answer is not correct. Do you want to try again?(Y/N):',end='')
           tryAns=str(input())
           if tryAns=='Y':
               tryNum=1
               tryAgain=True
               continue
           else:
               tryAgain=False
               print('Do you want to see the answer?(Y/N):',end='')
               seeAns=str(input())
               if seeAns=='Y':
                   print('the correct answer is:',listTest[2],end=' ')
               print('Do you want to play again?(Y/N):',end='')
               playAgain=str(input())
               if playAgain=='Y':
                   playTest=True
               else:
                   playTest=False
               break
        else:
            print('Your answer is not correct. Do you want to see answer?(Y/N):',end='')
            seeAns=str(input())
            if seeAns=='Y':
                print('The correct answer is:', listTest[2],end=' ')
            print('Do you want to play again?(Y/N):',end='')
            playAgain=str(input())
            if playAgain=='Y':
                playTest=True
            else:
                playTest=False
            break
    continue

                
           
            
            
        
         
            
    
