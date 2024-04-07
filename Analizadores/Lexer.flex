package Analizadores;
import static Analizadores.Tokens.*;
%%
%Class Lexer
%type Tokens

%espacio=[ ,\t,\r,\n]+

%{
    public String lexeme;
}%
%%
int |
if |
else |
while{ lexeme=yytext(); return Reservadas;}
{espacio}{\*Ignore*}
"//".*{\*Ignore*}
"=" {return Igual;}
"+"{return Resta;}
"*"{return Multiplicacion;}
"/"{return Division;}

"ceros" {return CEROS;}
"digito" {return DIGITO;}
"digConCero" {return DIGCONCERO;}
"letra" {return LETRA;}
"caracteresEspeciales" {return CARACTERESESPECIALES;}
"signo" {return SIGNO;}
"punto" {return PUNTO;}
"coma" {return COMA;}
"igual" {return IGUAL;}
"saltoDeLinea" {return SALTODELINEA;}
"llaveCuadradaAbierta" {return LLAVECUADRADAABIERTA;}
"llaveCuadradaCerrada" {return LLAVECUADRADACERRADA;}
"llaveCorcheteAbierta" {return LLAVECORCHETEABIERTA;}
"llaveCorcheteCerrada" {return LLAVECORCHETECERRADA;}
"llaveParentesisAbierta" {return LLAVEPARENTESISABIERTA;}
"llaveParentesisCerrada" {return LLAVEPARENTESISCERRADA;}
"finalExpresion" {return FINALLEXPRESION;}
"aperturaCierreComentarioSimple" {return APERTURACIERRECOMENTARIOSSIMPLE;}
"aperturaComentarioCompuesto" {return APERTURACOMENTARIOCOMPUESTO;}
"cierreComentarioCompuesto" {return CIERRECOMENTARIOCOMPUESTO;}
"null" {return NULL;}
"func" {return FUNC;}
"glob" {return GLOB;}
"loc" {return LOC;}
"sep" {return SEP;}
"inicioFinDeBloque" {return INICIOFINDEBLOQUE;}
"param" {return PARAM;}
"not" {return NOT;}
"read" {return READ;}
"write" {return WRITE;}
"comillasS" {return COMILLAS;}
"comillasD" {return COMILLASD;}



{L}({L}|{D})* (lexeme=yytext();return Identificador;)
("(-"{D}+)")|{D}+{lexeme=yytext();return Numero;}
. {return Error;}