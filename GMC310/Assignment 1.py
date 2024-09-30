#GMC310 Assignment 1
#u21429040 - Alisha Dockrat

import math


# QUESTION A
#Getting input from the user
#lat1 = float(input("lat1=-33.9"))
#lat2 = float(input("lat2=-33.9"))
#long1 = float(input("long1=18.41667"))
#long2 = float(input("long2=53.5167"))

lat1=-33.9
lat2 = -33.9
long1 = -53.51666667
long2 = 18.416666667
rad = 6371007.10

#ALWAYS work with radians in Python
lat1_rad = math.radians(lat1)
lat2_rad = math.radians(lat2)
long1_rad = math.radians(long1)
long2_rad = math.radians(long2)

#Formulas for calculation
a = math.radians(90-lat2)
b = math.radians(90-lat1)
C = math.radians(long2 - long1)

#Length of side C
c = math.acos(math.cos(a)*math.cos(b) + math.sin(a)*math.sin(b)*math.cos(C))

#Distance
dist = c*rad

#Metres to km
distkm = dist/1000

#KM to miles
distmi = distkm*0.621371

#Calculate time 
speed = 500 #miles/hour
time = distmi/speed
print(time)

##QUESTION B
i = math.sin(C)
ii = math.tan(lat2_rad)*math.cos(lat1_rad) - math.sin(lat1_rad)*math.cos(C)
iii = math.tan(lat1_rad)*math.cos(lat2_rad) - math.sin(lat2_rad)*math.cos(C)

#Convert parameters to radians
irad = math.radians(i)
iirad = math.radians(ii)
iiirad = math.radians(iii)

#Calculate directions
D12r = 2*math.atan((irad/(iirad-math.sqrt((irad**2)+(iirad**2))))) + math.radians(180)
D21r = 2*math.atan(irad/(-iiirad+math.sqrt((irad**2)+(iiirad**2)))) + math.radians(180)

#Convert directions to Degrees
D12 = math.degrees(D12r)
D21 = math.degrees(D21r)
print (D12)
print (D21)

