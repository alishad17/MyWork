import csv
import sys
import re
from sys import argv

def main():

    # TODO: Check for command-line usage - CHECKED

    # TODO: Read database file into a variable
    CSV = []
    with open (argv[1]) as file:
        readcsv = csv.reader(file)
        for row in readcsv:
            CSV.append(row)

    # TODO: Read DNA sequence file into a variable

    text = open(argv[2],"r")
    DNA = text.read()
    text.close()

    # TODO: Find longest match of each STR in DNA sequence

    nrow = len(CSV)
    ncol = len(CSV[0])

    lm = []
    for i in range(1,ncol):
        longm = longest_match(DNA,CSV[0][i])
        lm.append(longm)

    # TODO: Check database for matching profiles

    for k in range(1,nrow-1):
        flag = True
        for j in range(0,ncol-1):
            if lm[j] != int(CSV[k][j+1]):
                flag = False
                break
        if flag == True:
            print(CSV[k][0])
            break

    if flag == False:
        print("No match")

    return


def longest_match(sequence, subsequence):
    """Returns length of longest run of subsequence in sequence."""

    # Initialize variables
    longest_run = 0
    subsequence_length = len(subsequence)
    sequence_length = len(sequence)

    # Check each character in sequence for most consecutive runs of subsequence
    for i in range(sequence_length):

        # Initialize count of consecutive runs
        count = 0

        # Check for a subsequence match in a "substring" (a subset of characters) within sequence
        # If a match, move substring to next potential match in sequence
        # Continue moving substring and checking for matches until out of consecutive matches
        while True:

            # Adjust substring start and end
            start = i + count * subsequence_length
            end = start + subsequence_length

            # If there is a match in the substring
            if sequence[start:end] == subsequence:
                count += 1

            # If there is no match in the substring
            else:
                break

        # Update most consecutive matches found
        longest_run = max(longest_run, count)

    # After checking for runs at each character in seqeuence, return longest run found
    return longest_run


main()
