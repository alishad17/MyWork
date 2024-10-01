
from cs50 import get_string
import re

#get input
text = get_string("Text: ")

#find relevant
letter = re.findall(r'[\w]', text)
word = re.findall(r'[\s]', text)
sentence = re.findall(r'[.!?]', text)

#count
cletter = len(letter)
cword = len(word) + 1
csent = len(sentence)

#calculate formula
L = cletter * 100 / cword
S = csent * 100 / cword
index = round(0.0588 * L - 0.296 * S - 15.8)
i = str(index)

#print results
if index < 1:
    print("Before Grade 1")
elif index >= 16:
    print("Grade 16+")
else:
    print("Grade " + i)
