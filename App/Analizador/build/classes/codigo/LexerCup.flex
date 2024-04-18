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
D=[0-9]+
cero=0
digConCero=[0-9]
espacio=[ \t,\r,\n]+
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

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* In */
( "In" ) {return new Symbol(sym.IN, yychar, yyline, yytext());}

/* Float */
( "float" ) {return new Symbol(sym.FLOAT, yychar, yyline, yytext());}

/* Apertura Cierre Comentario Simple */
( "//" ) {return new Symbol(sym.APERTURACIERRECOMENTARIOSIMPLE, yychar, yyline, yytext());}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/* ComillasD */
( "\"" ) {return new Symbol(sym.COMILLAD, yychar, yyline, yytext());}

/* ComillasS */
( "\'" ) {return new Symbol(sym.COMILLAS, yychar, yyline, yytext());}

/* INT */
( "int" ) {return new Symbol(sym.INT, yychar, yyline, yytext());}

/* Tipo de dato String */
( String ) {return new Symbol(sym.Cadena, yychar, yyline, yytext());}

/* Palabra reservada If */
( if ) {return new Symbol(sym.If, yychar, yyline, yytext());}

/* Palabra reservada Else */
( else ) {return new Symbol(sym.Else, yychar, yyline, yytext());}

/* Palabra reservada Do */
( do ) {return new Symbol(sym.Do, yychar, yyline, yytext());}

/* Palabra reservada While */
( while ) {return new Symbol(sym.While, yychar, yyline, yytext());}

/* Palabra reservada For */
( for ) {return new Symbol(sym.For, yychar, yyline, yytext());}

/* IGUAL */
( "=" ) {return new Symbol(sym.IGUAL, yychar, yyline, yytext());}

/* Operador Suma */
( "+" ) {return new Symbol(sym.Suma, yychar, yyline, yytext());}

/* Operador Resta */
( "-" ) {return new Symbol(sym.Resta, yychar, yyline, yytext());}

/* Operador Multiplicacion */
( "*" ) {return new Symbol(sym.Multiplicacion, yychar, yyline, yytext());}

/* Operador Division */
( "/" ) {return new Symbol(sym.Division, yychar, yyline, yytext());}

/* Operadores logicos */
( "&&" | "||" | "!" | "&" | "|" ) {return new Symbol(sym.Op_logico, yychar, yyline, yytext());}

/*Operadores Relacionales */
( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {return new Symbol(sym.Op_relacional, yychar, yyline, yytext());}

/* Operadores Incremento y decremento */
( "++" | "--" ) {return new Symbol(sym.Op_incremento, yychar, yyline, yytext());}

/*Operadores Booleanos*/
( true | false ) {return new Symbol(sym.Op_booleano, yychar, yyline, yytext());}

/* Parentesis de apertura */
( "(" ) {return new Symbol(sym.LLAVEPARENTESISABRE, yychar, yyline, yytext());}

/* Parentesis de cierre */
( ")" ) {return new Symbol(sym.LLAVEPARENTESISCIERRA, yychar, yyline, yytext());}

/* Llave de apertura */
( "{" ) {return new Symbol(sym.LLAVECORCHETEABRE, yychar, yyline, yytext());}

/* Llave de cierre */
( "}" ) {return new Symbol(sym.LLAVECORCHETECIERRA, yychar, yyline, yytext());}

/* Cuadrada de apertura */
( "[" ) {return new Symbol(sym.LLAVECUADRADAABRE, yychar, yyline, yytext());}

/* Cuadrada de cierre */
( "]" ) {return new Symbol(sym.LLAVECUADRADACIERRA, yychar, yyline, yytext());}

/* Marcador de inicio de algoritmo */
( "main" ) {return new Symbol(sym.Main, yychar, yyline, yytext());}

/* Punto y coma */
( ";" ) {return new Symbol(sym.P_coma, yychar, yyline, yytext());}

/* FUNC */
( "func" ) {return new Symbol(sym.FUNC, yychar, yyline, yytext());}

/* Identificador */
{L}({L}|{D})* {return new Symbol(sym.IDENTIFICADOR, yychar, yyline, yytext());}

/* Numero */
("(-"{D}+")")|{D}+ {return new Symbol(sym.DIGITOS, yychar, yyline, yytext());}

/*Operadores Comparación */
( "=="|"!=" ) {return new Symbol(sym.Op_Comparacion, yychar, yyline, yytext());}

/* Salto de linea */
( "\n" ) {return new Symbol(sym.LINEA, yychar, yyline, yytext());}

/* Final de Expresion */
( ";" ) {return new Symbol(sym.FINALEXPRESION, yychar, yyline, yytext());}

/* Apertura de comentario compuesto */
( "/*" ) {return new Symbol(sym.APERTURACOMENTARIOCOMPUESTO, yychar, yyline, yytext());}

/* Cierre de comentario Compuesto */
( "*/" ) {return new Symbol(sym.CIERRECOMENTARIOCOMPUESTO, yychar, yyline, yytext()); }

/* NULL */
( "null" ) {return new Symbol(sym.NULL, yychar, yyline, yytext()); }

/* Glob */
( "glob" ) {return new Symbol(sym.GLOB, yychar, yyline, yytext()); }

/* Loc*/
( "loc" ) {return new Symbol(sym.LOC, yychar, yyline, yytext()); }

/* Separador */
( ":" ) {return new Symbol(sym.SEP, yychar, yyline, yytext()); }

/* Inicio o fin de bloque */
( "_" ) {return new Symbol(sym.INICIOFINBLOQUE, yychar, yyline, yytext()); }

/* Parametro */
( "param" ) {return new Symbol(sym.PARAM, yychar, yyline, yytext()); }

/* Not */
( "not" ) {return new Symbol(sym.NOT, yychar, yyline, yytext()); }

/* Read */
( "read" ) {return new Symbol(sym.READ, yychar, yyline, yytext()); }

/* Write */
( "write" ) {return new Symbol(sym.WRITE, yychar, yyline, yytext()); }

/* Punto */
( "." ) {return new Symbol(sym.PUNTO, yychar, yyline, yytext());}

/* Error de analisis */
 . {return new Symbol(sym.ERROR, yychar, yyline, yytext());}


