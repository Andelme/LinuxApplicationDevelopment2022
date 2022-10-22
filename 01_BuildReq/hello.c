#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define STR_LEN 1024

int main()
{
    char *str = malloc(STR_LEN * sizeof(*str));
    if(fgets(str, sizeof(str), stdin))
    {
        str[strlen(str) - 1] = '\0';
        printf("Hello, %s!\n", str);
    }

    free(str);
    return 0;
}