_It is advised to view this markdown file in some markdown editor like: https://dillinger.io/ (Ctrl+Click on the link and paste the content of this file there)_

_In each case, you need to enter the input without any prompt being raised, this is done for cleaner application_

# Count.l

## Assumptions
- \n is not considered as a space but as a character
- all other assumptions are intuitive

## How to run ?
- Enter following commands into terminal
    ```
    lex Count.l
    cc -lfl lex.yy.c
    ./a.out
    ```
- Enter the input string
- After entering the string press *enter* and *Ctrl+D*
- The number of characters, words, spaces and lines are printed onto console.

#

# Comments.l

## Assumptions
- Comments can be either single line (//) or multiline(/*---*/)
- all other assumptions are intuitive

## How to run ?
- Enter following commands into terminal
    ```
    lex Comments.l
    cc -lfl lex.yy.c
    ./a.out
    ```
- Enter the input C program
- After entering the program press *enter* and *Ctrl+D*
- The number of comment lines are printed and uncommented program is saved in **uncommented.c**

#

# ab.y

## Assumptions
- lexical analyzer for this is in the file ab.l
- valid input doesn't contain any space of \n and follows grammar rule i.e. 10 or more 'a' followed by a 'b'

## How to run ?
- Enter the following commands into terminal
    ```
    lex ab.l
    yacc -d ab.y
    gcc lex.yy.c y.tab.c -lfl
    ./a.out
    ```
- Enter the string, press enter and then Ctrl+D, if required.
- VALID or INVALID is printed onto console accordingly.

#

# calc.l

## Assumptions
- expression can have only + - * / operations
- operands can be either integers or variables
- variable names are alpha-numeric strings starting with an alphabet
- even if expression is wrong, number of variables, integers etc. are printed onto console
- expression can have brackets (parenthesis, curly and square brackets are allowed)
- any 2 consecutive operands must have an operator between them for expression to be valid

## How to run ?
- Enter following commands into terminal
    ```
    lex calc.l
    cc -lfl lex.yy.c
    ./a.out
    ```
- Enter the expression
- After entering the expression press *enter* and *Ctrl+D*
- VALID EXPRESSION or INVALID EXPRESSION is printed onto console accordingly
- Number of integers, identifiers, operators and brackets are also printed with their instances printed one in a line

#

# calc.y

## Assumptions
- it uses calc_.l as lex file
- expression can have only + - * / operations
- operands can be only integers
- even if expression is wrong, some junk value is printed as result with error message
- expression can have brackets (parenthesis, curly and square brackets are allowed)
- any 2 consecutive operands must have an operator between them for expression to be valid

## How to run ?
- Enter following commands into terminal
    ```
    lex calc_.l
    yacc -d calc.y
    gcc lex.yy.c y.tab.c -lfl
    ./a.out
    ```
- Enter the expression
- After entering the expression press *enter* and *Ctrl+D*
- Error is displayed if any
- Answer for the expression is printed
- If expression is wrong a junk value is printed along with error message (foreg: division by 0)