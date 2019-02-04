#this program aims to test if a string is a palindrome, namely it is read same forward and backward, or not

print('Please enter the test string:')     # prompt user to enter a test string
stringTest=str(input())
lenString=len(stringTest)                  #get the size of string in order to control the iteration times
count1=0                                   #the counter from the right end of the string
count2=0                                   #the counter from the left end of the string
isPalindrome=True                       # set a indicator to get the result of test 
while count1<lenString and count2<lenString:   #compare the letters from the left end of string and the letters from the right end of string one by one till the whole string is checked or any compared two letters are different
    if stringTest[count1].isalpha()==False:       #if any of compared two letters is not alphabet, then move to corresponding next letter
        count1+=1        
    if stringTest[lenString-1-count2].isalpha()==False:
        count2+=1
    if stringTest[count1]==stringTest[lenString-1-count2] or stringTest[count1]==stringTest[lenString-1-count2].upper() or stringTest[count1]==stringTest[lenString-1-count2].lower():
        count1+=1                                             #if the compared two letters are same disregarding the case of letter,then continue the comparison, the result indicator keeps default value 'True' 
        count2+=1
    else:
        isPalindrome=False                                    #if the compared two letters are different, then the test result is 'False', complet the test process
        break
print('the test string:\"%s'%stringTest,'\"is palindrome?', isPalindrome) #print out the test result
