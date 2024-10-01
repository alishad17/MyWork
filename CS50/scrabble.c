#include <ctype.h>
#include <cs50.h>
#include <stdio.h>
#include <string.h>

int l;

// Points assigned to each letter of the alphabet
int POINTS[] = {1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 5, 1, 3, 1, 1, 3, 10, 1, 1, 1, 1, 4, 4, 8, 4, 10};

int compute_score(string word);

int main(void)
{
    // Get input words from both players
    string word1 = get_string("Player 1: ");
    string word2 = get_string("Player 2: ");

    // Score both words
    int score1 = compute_score(word1);
    int score2 = compute_score(word2);

    // TODO: Print the winner
    if (score1 > score2)
    {
        printf("Player 1 wins!\n");
    }
    else if (score1 < score2)
    {
        printf("Player 2 wins!\n");
    }
    else
    {
        printf("Tie!\n");
    }

}

int compute_score(string word)
{
    // TODO: Compute and return score for string;

    //Initialise individual sum for lowercase/uppercase
    int sum1 = 0;
    int sum2 = 0;

    //Iterate through every letter of the word
    for (int i = 0, n = strlen(word); i < n; i++)
    {
        if (word[i] >= 'a' && word[i] <= 'z')
        {
            int value = word[i] - 97;
            int point1 = POINTS[value];
            sum1 += POINTS[value];
        }
        else if (word[i] >= 'A' && word[i] <= 'Z')
        {
            int value = word[i] - 65;
            int point2 = POINTS[value];
            sum2 += POINTS[value];
        }

    }

    int total = sum1 + sum2;
    return total;

}

        