#include <cs50.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>

int l, s, alpha;

int main(int argc, string argv[])
{

    // Ensure that the program will start with one key
    if (argc == 2)
    {
        // determining amount of letters
        l = strlen(argv[1]);

        //upper case use
        char use[26];
        for (int i = 0, n = strlen(argv[1]); i < n; i++)
        {
            use[i] = toupper(argv[1][i]);
        }
        //lower case use
        char luse[26];
        for (int i = 0, n = strlen(argv[1]); i < n; i++)
        {
            luse[i] = tolower(argv[1][i]);
        }

        // frequency to check for duplicates
        int f[26];
        for (s = 0; s < 26; s++)
        {
            f[s] = 0;
        }
        for (s = 0; s < l; s++)
        {
            if (use[s] >= 'A' && use[s] <= 'Z')
            {
               f[use[s] - 65]++;
            }
        }

         //code for invalidating non-alphabet characters
        for (int m = 0, p = strlen(argv[1]); m < p; m++)
        {
            if ((argv[1][m] >= 'a' && argv[1][m] <= 'z') || (argv[1][m] >= 'A' && argv[1][m] <= 'Z'))
            {
                alpha = 0;
            }
            else
            {
                printf("Please enter a valid key.");
                return 1;
            }

        }



        //final validation
        for (s = 0; s < 26; s++)
        {
            if (f[s] == 1)
            {
                if (l == 26 && alpha == 0)
                {
                   //input code for cipher
                   string plain = get_string("plaintext: ");

                   printf("ciphertext: ");
                   for (int i = 0, n = strlen(plain); i < n; i++)
                   {
                       if (plain[i] >= 'A' && plain[i] <= 'Z')
                       {
                           int value = plain[i] - 65;
                           char answer = use[value];
                           printf("%c", answer);
                       }
                       else if (plain[i] >= 'a' && plain[i] <= 'z')
                       {
                           int value = plain[i] - 97;
                           char answer = luse[value];
                           printf("%c", answer);
                       }
                      else
                       {
                          printf("%c", plain[i]);
                       }

                }

                    printf("\n");
                    return 0;

                 }
                else
                {
                     printf("Please enter a valid key.\n");
                     return 1;
                }
              }
          else
           {
              printf("Please enter a valid key.\n");
              return 1;
           }
        }

    }

    else
    {
        printf("Please enter a valid key.\n");
        return 1;
    }

}

