package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
Le=[a-zA-Z_]
D=[0-9]+
cero=[0]

espacio=[ \t,\r]+
%{
    public String lexeme;
%}
%%

/* Coma */
( "," ) {lexeme=yytext(); return COMA;}

/* Inicio o fin de bloque */
( "_") { lexeme=yytext(); return INICIOFINBLOQUE; }

/* Inicio o fin de bloque */
( "-") { lexeme=yytext(); return SIGNO; }

/* CHAR */
{Le}{1,1} {lexeme=yytext(); return LETRA;}

/* CERO */
{cero}{1,1} {lexeme=yytext(); return CERO;}

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* INT */
( "int" ) {lexeme = yytext(); return INT;}

/* not */
( "not" ) {lexeme = yytext(); return NOT;}

/* WRITE */
( "write" ) {lexeme = yytext(); return WRITE;}

/* Break */
( "break" ) {lexeme = yytext(); return BREAK;}

/* SWITCH */
( "switch" ) {lexeme = yytext(); return SWITCH;}

/* PARAM */
( "param" ) {lexeme = yytext(); return PARAM;}

/* RANGE */
( "range" ) {lexeme = yytext(); return RANGE;}

/* RETURN */
( "return" ) {lexeme = yytext(); return RETURN;}

/* CASE */
( "case" ) {lexeme = yytext(); return CASE;}

/* BOOL */
( "bool" ) {lexeme = yytext(); return BOOL;}

/* CHAR */
( "char" ) {lexeme = yytext(); return CHAR;}

/* ARREGLO */
( "arreglo" ) {lexeme = yytext(); return ARREGLO;}

/* Punto */
( "." ) {lexeme = yytext(); return PUNTO;}

/* In */
( "in" ) {lexeme=yytext(); return IN;}

/* Float */
( "float" ) {lexeme=yytext(); return FLOAT;}

/* Final de expresión */
( ";" ) { lexeme=yytext(); return FINALEXPRESION;}

/* Apertura Cierre Comentario Simple */
( "//" ) {lexeme=yytext(); return APERTURACIERRECOMENTARIOSIMPLE;}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/* Salto de linea */
( "\n" ) {return SALTOLINEA;}

/* ComillasD */
( "\"" ) {lexeme=yytext(); return COMILLAD;}

/* ComillasS */
( "\'" ) {lexeme=yytext(); return COMILLAS;}




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



/* Read */
( "read" ) { lexeme=yytext(); return READ; }



/* Tipo de dato String */
( "string" ) {lexeme=yytext(); return STRING;}

/* Palabra reservada If */
( if ) {lexeme=yytext(); return IF;}

/* Palabra reservada Else */
( else ) {lexeme=yytext(); return ELSE;}

/* Palabra reservada While */
( while ) {lexeme=yytext(); return WHILE;}

/* Palabra reservada For */
( for ) {lexeme=yytext(); return FOR;}

/* IGUAL */
( "=" ) {lexeme=yytext(); return IGUAL;}

/* Palabra reservada Do */
( do ) {lexeme = yytext(); return Do;}

/*Operadores Comparación */
( "=="|"!=" ) {lexeme = yytext(); return Op_comparacion;}

/*Operadores Binarias */
( "+"|"-"|"/"|"*"|"%"|"^" ) {lexeme = yytext(); return Op_binarias;}

/* Operadores Unarias */
( "++" | "--" ) {lexeme = yytext(); return Op_unarias;}

/*Operadores Relacionales */
( ">" | "<" | ">=" | "<=" ) {lexeme = yytext(); return Op_relacional;}

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
( "main" ) {lexeme=yytext(); return MAIN;}

/* Identificador */
{L}({L}|{D})* {lexeme=yytext(); return IDENTIFICADOR;}

/* Numero */
("(-"{D}+")")|{D}+ {lexeme=yytext(); return DIGITOS;}

/* Solicitud Faltantes Terminales */


/* Error de analisis */
 . {return ERROR;}
