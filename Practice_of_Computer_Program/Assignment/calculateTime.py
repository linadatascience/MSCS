"""+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
File: assignment2_ShowTime.py
Instructor: Nguyen Thai
Date: 9/19/2017
Student:
Description: 
    
    
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"""
import time
import calendar

# Get current time in seconds since January 1, 1970
currentTimeInSeconds = calendar.timegm(time.localtime())

# Calculate the currentHour, currentMinute and currentSecond 
# from currentTimeInSeconds using Python's numeric operators

#  INSERT YOUR CODE HERE.
# Get current hour based on given time(in seconds)
currentHour= (currentTimeInSeconds%(24*60*60))//(60*60)
#Get current minute based on given time 
currentMinute= (currentTimeInSeconds%(24*60*60)-currentHour*60*60)//60
# Get current second based on given time
currentSecond=currentTimeInSeconds%(24*3600)-currentHour*3600-currentMinute*60
#print(currentHour, currentMinute, currentSecond)

if currentHour>12:
    currentHour=currentHour-12
    print("Current Time is", currentHour,":",currentMinute,":",currentSecond,"PM")
else:
# Print current time
    print("Current time is ", currentHour, ":", currentMinute, ":", currentSecond,"AM")

