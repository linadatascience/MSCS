#here design a function to test a input number is a prime number or not
#if the input number is prime number, then return TRUE, otherwise return FALSE

def isPrime(num):
    i=2
    while i < num:  #test the given number is prime or not according to the definition of prime number:
                    #divding the number to test by from 2 to number-1 seperately, and if any remainder  
         if i!= num and num%i==0:    # of these divison is equal to zero, then the tested number is not prime number, otherwise
            #print('num:',num,'i:',i, 'residule of num/i:', num%i)
            return False            #the test number is prime
         if i==2:  #divid the given number by 2,3,5,7..., skip the even number except 2 in order to improve the efficiency
            i+=1
         else:
            i+=2
    return True

input_valid=False
while input_valid==False:
     print("Please input the test number:", end='')  #prompt user to enter the test number 
     test_num=int(input())
     if test_num<=1:
         print('the entered number is not valid!') #test the input number is valid or not, if not, print out the error message 
         continue                               #and ask user to enter number again, this process continues till the entered number is valid
     else:
         input_valid=True

print("The number", test_num,"is prime number:", isPrime(test_num))  #invoke the test prime function and print out the test result
