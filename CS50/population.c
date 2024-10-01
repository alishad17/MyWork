#include <cs50.h>
#include <stdio.h>

int main(void)
{
    // TODO: Prompt for start size

    int s;
    do
    {
        s = get_int("Start size: ");
    }
    while (s < 9);

    // TODO: Prompt for end size

    int e;
    do
    {
        e = get_int("End size: ");
    }
    while (e < s);

    // TODO: Calculate number of years until we reach threshold

    int n = s;
    int c;
    for (c=0; n < e; c++)
    {
        n = ((n/3) - (n/4) + n);
    }


    // TODO: Print number of years

    printf("Years: %i\n", c);
}
