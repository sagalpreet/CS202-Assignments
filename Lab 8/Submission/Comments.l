%{
#include <stdio.h>
int numCommentLines = 0;
int numLines(long long yyleng, char *yytext);
FILE *uncommented;
%}
%%
\/\*(.|\n)*\*\/   {numCommentLines += numLines(yyleng, yytext);}
(\/\/.*\n)        {numCommentLines++;}
(.|\n)            {printf("%c", yytext[0]); fprintf(uncommented, "%c", yytext[0]);}             
%%
int numLines(long long yyleng, char *yytext) {
    int numL = 1;
    for (int i = 0; i < yyleng; i++)
    {
        if (yytext[i] == '\n')
        {
            numL++;
        }
    }
    return numL;
}

int main(int argc, char *argv[]) {
    uncommented = fopen("uncommented.c", "w");
    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);
    fclose(uncommented);
    printf("\n---------------------------------------------\n");
    printf("Number of commented lines: %d\n", numCommentLines);
}