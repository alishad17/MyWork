# TODO

from cs50 import get_int

#get input number
n = get_int("Number: ")

#add non-multiplied digits
new = n
sum = 0
while new > 0:
    d = new % 10
    sum = d + sum
    new = new // 100

#get every other digit to multiply by 2
ne = n // 10
while ne > 0:
    d = ne % 10
    d2 = d * 2
    sum = (d2 % 10) + (d2 // 10) + sum
    ne = ne // 100

#length determination
strn = str(n)
l = len(strn)

#position determination
pp1 = strn[0]
pp2 = strn[1]
p1 = int(pp1)
p2 = int(pp2)


if sum % 10 == 0:
    if l == 15 and p1 == 3 and (p2 == 4 or p2 == 7):
        print("AMEX\n")
    elif l == 16 and p1 == 5 and p2 in range(1,6):
        print("MASTERCARD\n")
    elif (l == 13 or l == 16) and p1 == 4:
        print("VISA\n")
    else:
        print("INVALID\n")
else:
    print("INVALID\n")