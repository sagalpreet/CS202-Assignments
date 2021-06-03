%{
#include <stdio.h>
#include <string.h>
#include <math.h>
char isValid = 1, prevMatch = -1;
char bracket[1000];
int numB = 0;

int numIdentifiers = 0;
int numIntegers = 0;
int numOperators = 0;
int numBrackets = 0;

char **identifiers = 0;
char **operators = 0;
char **brackets = 0;
int *integers = 0;
char **deep__copy1(char **ar, int i, char *x);
void consoleLog1(char **ar, int size);
%}
%%
([A-Za-z][0-9A-Za-z]*)      {identifiers = deep__copy1(identifiers, numIdentifiers, yytext); numIdentifiers++; if (prevMatch == 1 | prevMatch == 2 | prevMatch == 5) {isValid = 0;} prevMatch = 1;}
([0-9]+)                    {integers = (int *) realloc(integers, sizeof(int) * (numIntegers + 1)); integers[numIntegers] = atoi(yytext); numIntegers++; if (prevMatch == 1 | prevMatch == 2 | prevMatch == 5) {isValid = 0;} prevMatch = 2;}
(\*|\+|\-|\/)               {operators = deep__copy1(operators, numOperators, yytext); numOperators++; if (prevMatch == 3 | prevMatch == 4) {isValid = 0;} prevMatch = 3;}
(\(|\{|\[)                  {brackets = deep__copy1(brackets, numBrackets, yytext); numBrackets++; bracket[numB] = yytext[0]; numB++; if (prevMatch == 1 | prevMatch == 2 | prevMatch == 5) {isValid = 0;} prevMatch = 4;}
(\)|\}|\])                  {brackets = deep__copy1(brackets, numBrackets, yytext); numBrackets++; if(numB == 0 || yytext[0] - bracket[numB - 1] > 2) {isValid = 0;} else if (numB > 0) {numB--;}; if (prevMatch == 4 | prevMatch == 3) {isValid = 0;} prevMatch = 5;}
[\t \n]
(.)                         isValid = 0;
%%
char **deep__copy1(char **ar, int i, char *x)
{
    ar = (char **) realloc(ar, sizeof(char *) * (i + 1));
    ar[i] = (char *) malloc(sizeof(char) * (strlen(x)));
    for (int j = 0; j < strlen(x); j++)
    {
        ar[i][j] = x[j];
    }
    return ar;
}

void consoleLog1(char **ar, int size)
{
    for (int i = 0; i < size; i++)
    {
        printf("%s\n", ar[i]);
    }
    printf("\n");
}

int main(int argc, char *argv[]) {
    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);
    if (numB > 0 | prevMatch == 3)
    {
        isValid = 0;
    }
    if (isValid == 0)
    {
        printf("\nINVALID EXPRESSION");
    }
    else
    {
        printf("\nVALID EXPRESSION");
    }
    printf("\n---------------------------------------------\n");
    printf("Number of integers are: %d\n", numIntegers);
    for (int i = 0; i < numIntegers; i++)
    {
        printf("%d\n", integers[i]);
    }
    printf("\n");

    printf("Number of identifiers are: %d\n", numIdentifiers);
    consoleLog1(identifiers, numIdentifiers);

    printf("Number of operators are: %d\n", numOperators);
    consoleLog1(operators, numOperators);

    printf("Number of brackets are: %d\n", numBrackets);
    consoleLog1(brackets, numBrackets);
}