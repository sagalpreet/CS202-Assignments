%{
#include <stdio.h>
#include <string.h>
#include <math.h>
#include "y.tab.h"
extern int yylval;
void yyerror(const char* message);
%}
%%
(.|\n)       return yytext[0];
%%
