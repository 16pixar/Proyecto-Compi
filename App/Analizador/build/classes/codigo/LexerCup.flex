package codigo;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[a-zA-Z_]+
Le=[a-zA-Z_]
D=[0-9]+
cero=[0]
digConCero=[0-9]
espacio=[ \t,\r]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%

/* Coma */
( "," ) {return new Symbol(sym.COMA, yychar, yyline, yytext());}

/* CERO */
{cero} {return new Symbol(sym.CERO, yychar, yyline, yytext());}


/* Inicio o fin de bloque */
("_") {return new Symbol(sym.INICIOFINBLOQUE, yychar, yyline, yytext());}

/* SIGNO */
( "-" ) {return new Symbol(sym.SIGNO, yychar, yyline, yytext());}

/* CHAR */
{Le}{1,1} {return new Symbol(sym.LETRA, yychar, yyline, yytext());}


/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* INT */
( "int" ) {return new Symbol(sym.INT, yychar, yyline, yytext());}

/* not */
( "not" ) {return new Symbol(sym.NOT, yychar, yyline, yytext());}

/* WRITE */
( "write" ) {return new Symbol(sym.WRITE, yychar, yyline, yytext());}

/* Break */
( "break" ) {return new Symbol(sym.BREAK, yychar, yyline, yytext());}

/* SWITCH */
( "switch" ) {return new Symbol(sym.SWITCH, yychar, yyline, yytext());}

/* PARAM */
( "param" ) {return new Symbol(sym.PARAM, yychar, yyline, yytext());}

/* RANGE */
( "range" ) {return new Symbol(sym.RANGE, yychar, yyline, yytext());}

/* RETURN */
( "return" ) {return new Symbol(sym.RETURN, yychar, yyline, yytext());}

/* CASE */
( "case" ) {return new Symbol(sym.CASE, yychar, yyline, yytext());}

/* BOOL */
( "bool" ) {return new Symbol(sym.BOOL, yychar, yyline, yytext());}

/* CHAR */
( "char" ) {return new Symbol(sym.CHAR, yychar, yyline, yytext());}

/* ARREGLO */
( "arreglo" ) {return new Symbol(sym.ARREGLO, yychar, yyline, yytext());}

/* Punto */
( "." ) {return new Symbol(sym.PUNTO, yychar, yyline, yytext());}

/* In */
( "in" ) {return new Symbol(sym.IN, yychar, yyline, yytext());}

/* Float */
( "float" ) {return new Symbol(sym.FLOAT, yychar, yyline, yytext());}

/* Final de expresión */
( ";" ) {return new Symbol(sym.FINALEXPRESION, yychar, yyline, yytext());}

/* Apertura Cierre Comentario Simple */
( "//" ) {return new Symbol(sym.APERTURACIERRECOMENTARIOSIMPLE, yychar, yyline, yytext());}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/* Salto de linea */
( "\n" ) {return new Symbol(sym.SALTOLINEA, yychar, yyline, yytext());}

/* ComillasD */
( "\"" ) {return new Symbol(sym.COMILLAD, yychar, yyline, yytext());}

/* ComillasS */
( "\'" ) {return new Symbol(sym.COMILLAS, yychar, yyline, yytext());}

/* Apertura de comentario compuesto */
( "/*" ) {return new Symbol(sym.APERTURACOMENTARIOCOMPUESTO, yychar, yyline, yytext());}

/* Cierre de comentario compuesto */
( "*/" ) {return new Symbol(sym.CIERRECOMENTARIOCOMPUESTO, yychar, yyline, yytext());}

/* Null */
( "null" ) {return new Symbol(sym.NULL, yychar, yyline, yytext());}

/* func */
( "func" ) {return new Symbol(sym.FUNC, yychar, yyline, yytext());}

/* Glob */
( "glob" ) {return new Symbol(sym.GLOB, yychar, yyline, yytext());}

/* Loc */
("loc") {return new Symbol(sym.LOC, yychar, yyline, yytext());}

/* Separador */
( ":" ) {return new Symbol(sym.SEP, yychar, yyline, yytext());}

/* Read */
( "read" ) {return new Symbol(sym.READ, yychar, yyline, yytext());}

/* Tipo de dato String */
( "string" ) {return new Symbol(sym.STRING, yychar, yyline, yytext());}

/* Palabra reservada If */
( if ) {return new Symbol(sym.IF, yychar, yyline, yytext());}

/* Palabra reservada Else */
( else ) {return new Symbol(sym.ELSE, yychar, yyline, yytext());}

/* Palabra reservada While */
( while ) {return new Symbol(sym.WHILE, yychar, yyline, yytext());}

/* Palabra reservada For */
( for ) {return new Symbol(sym.FOR, yychar, yyline, yytext());}

/* IGUAL */
( "=" ) {return new Symbol(sym.IGUAL, yychar, yyline, yytext());}

/*Operadores Binarias */
( "+"|"-"|"/"|"*"|"%"|"^" ) {return new Symbol(sym.Op_binarias, yychar, yyline, yytext());}

/* Operadores Unarias */
( "++" | "--" ) {return new Symbol(sym.Op_unarias, yychar, yyline, yytext());}

/*Operadores Relacionales */
( ">" | "<" | ">=" | "<=" ) {return new Symbol(sym.Op_relacional, yychar, yyline, yytext());}

/*Operadores Comparación */
( "=="|"!=" ) {return new Symbol(sym.Op_comparacion, yychar, yyline, yytext());}

/* Operadores logicos */
( "&" | "|") {return new Symbol(sym.Op_logico, yychar, yyline, yytext());}

/*Operadores Booleanos*/    
(true | false) {return new Symbol(sym.Op_booleano, yychar, yyline, yytext());}

/* Parentesis de apertura */
( "(" ) {return new Symbol(sym.LLAVEPARENTESISABRE, yychar, yyline, yytext());}

/* Parentesis de cierre */
( ")" ) {return new Symbol(sym.LLAVEPARENTESISCIERRA, yychar, yyline, yytext());}

/* Llave de apertura */
( "{" ) {return new Symbol(sym.LLAVECORCHETEABRE, yychar, yyline, yytext());}

/* Llave de cierre */
( "}" ) {return new Symbol(sym.LLAVECORCHETECIERRA, yychar, yyline, yytext());}

/* Corchete de apertura */
( "[" ) {return new Symbol(sym.LLAVECUADRADAABRE, yychar, yyline, yytext());}

/* Corchete de cierre */
( "]" ) {return new Symbol(sym.LLAVECUADRADACIERRA, yychar, yyline, yytext());}

/* Marcador de inicio de algoritmo */
( "main" ) {return new Symbol(sym.MAIN, yychar, yyline, yytext());}

/* Identificador */
{L}({L}|{D})* {return new Symbol(sym.IDENTIFICADOR, yychar, yyline, yytext());}

/* Numero */
("(-"{D}+")")|{D}+ {return new Symbol(sym.DIGITOS, yychar, yyline, yytext());}

/* Error de analisis */
 . {return new Symbol(sym.ERROR, yychar, yyline, yytext());}



