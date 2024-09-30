#GMC310 Assignment 2
#u21429040 - Alisha Dockrat

import math

#Getting input from the user
rad = float(input("rad= "))
origin = float(input("origin= "))
cm = float(input("cm= "))
northings = float(input("northings= "))
eastings  = float(input("eastings= "))

#rad = 6371007.10
#origin = 0
#cm = 24
#northings = -2894540.29
#eastings = 63893.09

cm_rad = math.radians(cm)
D = (northings/rad) + origin
lat = math.asin(math.sin(D)*math.cos(eastings/rad))
long = cm_rad + math.atan((math.tan(eastings/rad))/math.cos(D))
B = math.cos(lat)*math.sin(long - cm_rad)
north_inv = rad*(math.atan(math.tan(lat)/math.cos(long-cm_rad))-origin)
east_inv = rad*math.asin(B)

#latitude
print(lat)
#longitude
print(long)
#inverse Northings
print(north_inv)
#inverse eastings
print(east_inv)


