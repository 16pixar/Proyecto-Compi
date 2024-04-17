package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
cero=0
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
( "\"" ) {lexeme=yytext(); return ComillasD;}

/* ComillasS */
( "\'" ) {lexeme=yytext(); return ComillasS;}

/* Final de expresión */
( ";" ) { return new Symbol(sym.finalExpresion, yychar, yyline, yytext()); }

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



/* Tipos de datos */
( byte | int | char | long | float | double ) {lexeme=yytext(); return T_dato;}

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

/* Operador Suma */
( "+" ) {lexeme=yytext(); return Suma;}

/* Operador Resta */
( "-" ) {lexeme=yytext(); return Resta;}

/* Operador Multiplicacion */
( "*" ) {lexeme=yytext(); return Multiplicacion;}

/* Operador Division */
( "/" ) {lexeme=yytext(); return Division;}

/* Operadores logicos */
( "&&" | "||" | "!" | "&" | "|" ) {lexeme=yytext(); return Op_logico;}

/*Operadores Relacionales */
( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {lexeme = yytext(); return Op_relacional;}

/* Operadores Atribucion */
( "+=" | "-="  | "*=" | "/=" | "%=" ) {lexeme = yytext(); return Op_atribucion;}

/* Operadores Incremento y decremento */
( "++" | "--" ) {lexeme = yytext(); return Op_incremento;}

/*Operadores Booleanos*/
(true | false)      {lexeme = yytext(); return Op_booleano;}

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

/* func */
( "func" ) {lexeme=yytext(); return FUNC;}

/* Identificador */
{L}({L}|{D})* {lexeme=yytext(); return IDENTIFICADOR;}

/* Numero */
("(-"{D}+")")|{D}+ {lexeme=yytext(); return DIGITOS;}

/* Error de analisis */
 . {return ERROR;}
