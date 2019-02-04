#this program is used to calculate the amount of money that the purchased CD's
#value at the end of investment term given input APY

#ask user to input the purchased CD's value and check if the input value is valid or not
print("Enter CD's purchase value ($):", end='')
CD_Base=float(input())
if CD_Base<=0:
      print("the entered CD value is invalid")
      exit()

#ask user to input the annual percentage yield(APY) for the purchased CD, and check the validation of input
print("Enter the CD's annual percentage yield (%):", end='')
APY_CD=float(input())
if APY_CD <=0:
      print("the entered APY is invalid!")
      exit()

#ask user to inpupt the investment term in months and check the validation of input
print("Enter the CD's investment term (months):", end='')
Invest_Term=int(input())
if Invest_Term<=0:
      print("the entered investment term is invalid!")
      exit()
#set the initial value of CD
CD_Amt=CD_Base

#calculate the value of CD at the end of investment term
for count in range(Invest_Term):
#    CD_Amt=round(CD_Amt*(1+APY_CD/1200),2)  #get the two decimal digits after decimal point
    CD_Amt=CD_Amt*(1+APY_CD/1200)
#print out the calculated result
print("Your CD is worth $", '%0.2f'%CD_Amt,"at the end of the", Invest_Term, "months term")
