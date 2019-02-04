year=int(input())
if year<=0:
    print('the input year is invalid')
    exit()
    
modular=year%12
if modular==0:
    Chinese_Zodiac='Monkey'
elif modular==1:
    Chinese_Zodiac='Rooster'
elif modular==2:
    Chinese_Zodiac='Dog'
elif modular==3:
    Chinese_Zodiac='Pig'
elif modular==4:
    Chinese_Zodiac='Rat'
elif modular==5:
    Chinese_Zodiac='Ox'
elif modular==6:
    Chinese_Zodiac='Tiger'
elif modular==7:
    Chinese_Zodiac='Rabbit'
elif modular==8:
    Chinese_Zodiac='Dragon'
elif modular==9:
    Chinese_Zodiac='Snake'
elif modular==10:
    Chinese_Zodiac='Horse'
else:
    Chinese_Zodiac='Sheep'
print('the Chinese Zodiac of year',str(year),' is', Chinese_Zodiac)
