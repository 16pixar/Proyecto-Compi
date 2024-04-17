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

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/* Caracteres Especiales */
"#"|"("|")"|","|"."|"/"|";"|"?"|"@"|"\\"|"\["|"\]"|"`"|"\{"|"\}"|"~" { return new Symbol(sym.SPECIAL_CHAR, yychar, yyline, yytext()); }

/* Signo */
( "-"){ return new Symbol(sym.Signo, yychar, yyline, yytext()); }

/* punto */
( "." ){ return new Symbol(sym.Punto, yychar, yyline, yytext()); }

/* Coma */
( "coma" ){ return new Symbol(sym.Coma, yychar, yyline, yytext()); }

/ *Salto de Linea* /
( "\n" ) { return new Symbol(sym.SaltoLinea, yychar, yyline, yytext()); }



/* Final de expresión */
( ";" ) { return new Symbol(sym.finalExpresion, yychar, yyline, yytext()); }

/* Apertura de comentario simple */
( "//" ){ return new Symbol(sym.aperturaCierreComentarioSimple, yychar, yyline, yytext()); }

/* Apertura de comentario compuesto */
( "/*" ) { return new Symbol(sym.aperturaComentarioCompuesto, yychar, yyline, yytext()); }

/* Cierre de comentario compuesto */
( "*/" ) { return new Symbol(sym.cierreComentarioCompuesto, yychar, yyline, yytext()); }

/* Null */
( "null" ) { return new Symbol(sym.null, yychar, yyline, yytext()); }

/* Func */
( "func" ) { return new Symbol(sym.func, yychar, yyline, yytext()); }

/* Glob */
( "glob" ) { return new Symbol(sym.glob, yychar, yyline, yytext()); }

/* Loc */
( "loc") { return new Symbol(sym.loc, yychar, yyline, yytext()); }

/* Separador */
( ":" ) { return new Symbol(sym.sep, yychar, yyline, yytext()); }

/* Inicio o fin de bloque */
( "_") { return new Symbol(sym.inicioFinDeBloque, yychar, yyline, yytext()); }

/* Parámetro */
( "param" ) { return new Symbol(sym.param, yychar, yyline, yytext()); }

/* Not */
( "not" ) { return new Symbol(sym.not, yychar, yyline, yytext()); }

/* Read */
( "read" ) { return new Symbol(sym.read, yychar, yyline, yytext()); }

/* Write */
( "write") { return new Symbol(sym.write, yychar, yyline, yytext()); }




/* ComillasD */
( "\"" ) {return new Symbol(sym.ComillasD, yychar, yyline, yytext());}

/* ComillasS */
( "\'" ) {return new Symbol(sym.ComillasS, yychar, yyline, yytext());}

/* Tipos de datos */
( byte | char | long | float | double ) {return new Symbol(sym.T_dato, yychar, yyline, yytext());}

/* Tipo de dato Int (Para el main) */
( "int" ) {return new Symbol(sym.Int, yychar, yyline, yytext());}

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

/* Operadores Atribucion */
( "+=" | "-="  | "*=" | "/=" | "%=" | "=" ) {return new Symbol(sym.Op_atribucion, yychar, yyline, yytext());}

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

/* Error de analisis */
 . {return new Symbol(sym.ERROR, yychar, yyline, yytext());}


