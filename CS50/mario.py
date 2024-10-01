# TODO


from cs50 import get_int


def main():
    height = get_height()
    for i in range(height):

       #code for spaces
       for m in range(height - i - 1,0,-1):
        print(" ", end="")

        #code for hashtag
       for h in range(i+1):
        print("#", end="")

        #code for middle space
       print("  ", end="")

        #code for hashtag
       for l in range(i+1):
         print("#", end="")

        #code for newline after every row
       print()


def get_height():
    while True:
        n = get_int("Height: ")
        if n > 0 and n < 9:
            return n

main()

