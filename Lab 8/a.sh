#!/bin/bash

lex calc_.l
yacc -d calc.y
gcc lex.yy.c y.tab.c -lfl
./a.out

#lex calc.l
#cc -lfl lex.yy.c
#./a.out