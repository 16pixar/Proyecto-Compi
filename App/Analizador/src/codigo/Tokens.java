
package codigo;

/**
 *
 * 
 */
public enum Tokens {
    Linea,
    INT,
    IN,
    T_dato,
    Cadena,
    IF,
    ELSE,
    Do,
    WHILE,
    FOR,
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
    MAIN,
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
    APERTURACIERRECOMENTARIOSIMPLE, // '//' Probando
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
    IDENTIFICADOR,
    FLOAT,
    ARREGLO,
    BOOL,
    RANGE,
    RETURN,
    CASE,
    STRING,
    BREAK,
    SWITCH
}
