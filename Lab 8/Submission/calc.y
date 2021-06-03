%{
#include <stdio.h>
void yyerror(const char* message);
int yylex();
%}

%token NUMBER ID
%left '+' '-'
%left '*' '/'

%%
E : T	{
			printf("Answer => %d\n", $$);
			return 0;
		}

T :
	'(' T ')' 	{$$ = $2;}
	|'{' T '}' 	{$$ = $2;}
	|'[' T ']' 	{$$ = $2;}
    |T '+' T 	{$$ = $1 + $3;}
	| T '-' T 	{$$ = $1 - $3;}
	| T '*' T 	{$$ = $1 * $3;}
	| T '/' T 	{if ($3 != 0) {$$ = $1 / $3;} else {printf("DIVISION BY ZERO ERROR\n"); $$ = -1;}}
    | NUMBER 	{$$ = $1;}
%%

int main()
{
	yyparse();
}

void yyerror(const char* message)
{
	printf("ERROR: %s", message);
}
