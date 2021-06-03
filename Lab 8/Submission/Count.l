%{
#include <stdio.h>
int lines = 0, words = 0, characters = 0, spaces = 0;
%}
%%
\n            {lines++; characters++;}
[\t ]         {characters += yyleng; spaces += yyleng;}
[^\t \n]+     {characters += yyleng; words += 1;}
%%
int main(int argc, char *argv[]) {
    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);
    printf("---------------------------------------\n");
    printf("Number of characters: %d\n", characters);
    printf("Number of words: %d\n", words);
    printf("Number of spaces: %d\n", spaces);
    printf("Number of lines: %d\n", lines);
    printf("---------------------------------------\n");
}