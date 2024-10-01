#include <cs50.h>
#include <stdio.h>
#include <string.h>
#include <math.h>

int count_letters(string text);
int count_words(string text);
int count_sentences(string text);

int main(void)
{
    //acquiring necessary information
    string text = get_string("Text: ");
    int length = count_letters(text);
    float words = count_words(text);
    int sent = count_sentences(text);

    //using the formula
    float L = length / words * 100;
    float S = sent / words * 100;
    float index = 0.0588 * L - 0.296 * S - 15.8;

    //print results
    if (index < 1)
    {
        printf("Before Grade 1\n");
    }
    else if (index >= 16)
    {
        printf("Grade 16+\n");
    }
    else
    {
        int c = roundf(index);
        printf("Grade %i\n",c);
    }
}

int count_letters(string text)
{
    int count = 0;

    for (int i = 0, n = strlen(text); i < n; i++)
    {
        if ((text[i] >= 'a' && text[i] <= 'z') || (text[i] >= 'A' && text[i] <= 'Z'))
        {
            count++;
        }
    }

    return count;
}

int count_words(string text)
{
    int count = 0;

    for (int i = 0; text[i] != '\0'; i++)
    {
        if (text[i] == ' ')
        {
            count++;
        }
    }

    return count + 1;
}

int count_sentences(string text)
{
    int count = 0;

    for (int i = 0; text[i] != '\0'; i++)

      if (text[i] == '.' || text[i] == '!' || text[i] == '?')
      {
          count++;
      }
    return count;
}