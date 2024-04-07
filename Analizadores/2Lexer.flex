%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <conio.h> //Para getch()
    File *yyin;

%}

%option noyywrapv // Para que solo se lea un fichero de entrada
%option yylineno // Para que se muestre el numero de linea


