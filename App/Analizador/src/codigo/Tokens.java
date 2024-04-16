
package codigo;

/**
 *
 * 
 */
public enum Tokens {
    Linea,
    Comillas,
    T_dato,
    Cadena,
    If,
    Else,
    Do,
    While,
    For,
    IGUAL,
    Suma,
    Resta,
    Multiplicacion,
    Division,
    Op_logico,
    Op_incremento,
    Op_relacional,
    Op_atribucion,
    Op_booleano,
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
    CHAR
}
