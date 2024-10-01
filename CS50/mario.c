#include <cs50.h>
#include <stdio.h>


int main(void)
{
    //ensure input is valid
    int n;
    do
    {
        n = get_int("Height: ");
    }
    while (n < 1 || n > 8);


    for (int i = 0; i < n; i++)
    {
        {
            //code for spaces
            for (int m = n - i -1; m > 0 ; m--)
            printf(" ");

            //code for hastags
            for (int h = 0 ; h <= i ; h++)
            printf("#");

            //code for space in between
            printf("  ");

            for (int h = 0 ; h <= i ; h++)
            printf("#");

        }

        // Move to next row
        printf("\n"); }

}

