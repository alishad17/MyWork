#include <cs50.h>
#include <stdio.h>
#include <math.h>


int main(void)
{

    long n, l, new;
    int d, d2;
    int sum = 0;

    do
    {
        n = get_long("Number: ");
    }
    while (n <= 0);

    //code for length
    l = (int)(n ? log10(n) + 1 : 1);

    //code for single adding digits
    new = n;
    while (new > 0)
    {
        d = new % 10;
        sum = d + sum;
        new = new / 100;
    }

   //code for *2 digits
    new = n / 10;
    while (new > 0)
    {
       d = new % 10;
       d2 = d * 2;
       sum = (d2 % 10) + (d2 / 10) + sum;
       new = new / 100;
    }

    //determination of 1st/2nd digit

    double length = l;
    long pow1 = pow(10, length);
    long pow2 = pow(10, (length - 1));
    long pow3 = pow(10, (length - 2));
    long df = (n % pow1 - (n % pow2)) / pow2;
    long ds = (n % pow2 - (n % pow3)) / pow3;

    //code for validation and card type
    if (sum % 10 == 0)
    {
        if ((l == 13 || l == 16) && df == 4)
        {
            printf("VISA\n");
        }
        else if (l == 15 && df == 3 && (ds == 4 || ds == 7))
        {
            printf("AMEX\n");
        }
        else if (l == 16 && df == 5 && (ds == 1 || ds == 2 || ds == 3 || ds == 4 || ds == 5))
        {
             printf("MASTERCARD\n");
        }
        else
        {
             printf("INVALID\n");
        }

    }
    else
    printf("INVALID\n");

}
