package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+

espacio=[ \t,\r]+
%{
    public String lexeme;
%}
%%

/* Coma */
( "," ) {lexeme=yytext(); return COMA;}



/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/* Salto de linea */
( "\n" ) {return Linea;}

/* ComillasD */
( "\"" ) {lexeme=yytext(); return COMILLAD;}

/* ComillasS */
( "\'" ) {lexeme=yytext(); return COMILLAS;}

/* Final de expresión */
( ";" ) { lexeme=yytext(); return FINALEXPRESION; }

/* Apertura de comentario compuesto */
( "/*" ) {lexeme=yytext(); return APERTURACOMENTARIOCOMPUESTO; }

/* Cierre de comentario compuesto */
( "*/" ) { lexeme=yytext(); return CIERRECOMENTARIOCOMPUESTO;  }

/* Null */
( "null" ) { lexeme=yytext(); return NULL;   }

/* func */
( "func" ) {lexeme=yytext(); return FUNC;}

/* Glob */
( "glob" ) { lexeme=yytext(); return GLOB;}

/* Loc */
("loc") { lexeme=yytext(); return LOC;}

/* Separador */
( ":" ) { lexeme=yytext(); return SEP;}

/* Inicio o fin de bloque */
( "_") { lexeme=yytext(); return INICIOFINBLOQUE; }

/* Parámetro */
( "param" ) { lexeme=yytext(); return PARAM; }

/* Not */
( "not" ) { lexeme=yytext(); return NOT; }

/* Read */
( "read" ) { lexeme=yytext(); return READ; }

/* Write */
( "write") { lexeme=yytext(); return WRITE; }

/* Tipos de datos */
( int | bool | float | char | string | arreglo ) {lexeme=yytext(); return T_dato;}

/* Tipo de dato String */
( String ) {lexeme=yytext(); return Cadena;}

/* Palabra reservada If */
( if ) {lexeme=yytext(); return If;}

/* Palabra reservada Else */
( else ) {lexeme=yytext(); return Else;}

/* Palabra reservada Do */
( do ) {lexeme=yytext(); return Do;}

/* Palabra reservada While */
( while ) {lexeme=yytext(); return While;}

/* Palabra reservada For */
( for ) {lexeme=yytext(); return For;}

/* IGUAL */
( "=" ) {lexeme=yytext(); return IGUAL;}

/*Operadores Binarias */
( "+"|"-"|"/"|"*"|"%"|"^" ) {lexeme = yytext(); return Op_binarias;}

/* Operadores Unarias */
( "++" | "--" ) {lexeme = yytext(); return Op_unarias;}

/*Operadores Relacionales */
( ">" | "<" | ">=" | "<=" ) {lexeme = yytext(); return Op_relacional;}

/*Operadores Comparación */
( "=="|"!=" ) {lexeme = yytext(); return Op_comparacion;}

/* Operadores logicos */
( "&" | "|") {lexeme=yytext(); return Op_logico;}

/*Operadores Booleanos*/    
(true | false) {lexeme = yytext(); return Op_booleano;}

/* Parentesis de apertura */
( "(" ) {lexeme=yytext(); return LLAVEPARENTESISABRE;}

/* Parentesis de cierre */
( ")" ) {lexeme=yytext(); return LLAVEPARENTESISCIERRA;}

/* Llave de apertura */
( "{" ) {lexeme=yytext(); return LLAVECORCHETEABRE;}

/* Llave de cierre */
( "}" ) {lexeme=yytext(); return LLAVECORCHETECIERRA;}

/* Corchete de apertura */
( "[" ) {lexeme = yytext(); return LLAVECUADRADAABRE;}

/* Corchete de cierre */
( "]" ) {lexeme = yytext(); return LLAVECUADRADACIERRA;}

/* Marcador de inicio de algoritmo */
( "main" ) {lexeme=yytext(); return Main;}

/* Punto y coma */
( ";" ) {lexeme=yytext(); return P_coma;}

/* Identificador */
{L}({L}|{D})* {lexeme=yytext(); return IDENTIFICADOR;}

/* Numero */
("(-"{D}+")")|{D}+ {lexeme=yytext(); return DIGITOS;}

/* Tipos de Datos */
( "bool" ) {lexeme = yytext(); return BOOL;}

/* CHAR */
( "char" ) {lexeme = yytext(); return CHAR;}

/* INT */
( "int" ) {lexeme = yytext(); return INT;}

/* ARREGLO */
( "arreglo" ) {lexeme = yytext(); return ARREGLO;}

/* Punto */
( "." ) {lexeme = yytext(); return PUNTO;}

/* Error de analisis */
 . {return ERROR;}
