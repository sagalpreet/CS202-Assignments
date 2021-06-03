%{
#include <stdio.h>
void yyerror(const char* message);
int yylex();
%}

%%
E : T	{
            printf("VALID\n");
            return 0;
		}

T :
    'a' 'a' 'a' 'a' 'a' 'a' 'a' 'a' 'a' A 'b'

A : 
    A 'a'
    | 'a'
%%

int main()
{
	yyparse();
}

void yyerror(const char* message)
{
	printf("INVALID\n");
}
