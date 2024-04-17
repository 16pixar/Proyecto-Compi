
package codigo;

/**
 *
 * 
 */
public enum Tokens {
    Linea,
    ComillasD,
    ComillasS,
    T_dato,
    Cadena,
    If,
    Else,
    Do,
    While,
    For,
    IGUAL,
    Op_binarias,
    Op_logico,
    Op_unarias,
    Op_relacional,
    Op_booleano,
    Op_comparacion,
    LLAVEPARENTESISABRE,
    LLAVEPARENTESISCIERRA,
    LLAVECORCHETEABRE,
    LLAVECORCHETECIERRA,
    LLAVECUADRADAABRE,
    LLAVECUADRADACIERRA,
    Main,
    P_coma,
    LETRA,
    DIGITOS,
    CERO,
    ERROR,
    DIGCONCERO, //[0-9]
    CARACTERESPECIALES, // [#|"|$|%|&|'|(|)|*|+|,|\|-|.|/|;|<|=|>|?|@|\|[|]|^|`|\|{|}|~]
    SIGNO, //'-'
    PUNTO, // '.'
    COMA, // ','
    SALTOLINEA,// '\n'
    FINALEXPRESION, // ;
    APERTURACIERRECOMENTARIOSIMPLES, // '//'
    APERTURACOMENTARIOCOMPUESTO, // '/*'
    CIERRECOMENTARIOCOMPUESTO, // '*/'
    NULL,
    FUNC,
    GLOB,
    LOC,
    SEP,
    INICIOFINBLOQUE,
    PARAM,
    NOT,
    READ,
    WRITE,
    COMILLAS,
    COMILLAD,
    CHAR,
    IDENTIFICADOR
}
