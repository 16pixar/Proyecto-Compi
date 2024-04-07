
/**
 *
 * @author aronm
 * Enumeracion de operandos a realizar durnate el procesod e compilacion 
 */
public class Tokens {
    private String valor;
    private Tipos tipos;

    // Setters y Getters --> Encapsulamiento
    /**
     * @param tipos 
     * @return tipos
     */
    public Tipos getTipos() {
        return tipos;
    }
    /**
     * @param valor 
     * @return valor
     */
    public String getValor() {
        return valor;
    }
    /**
     * @param valor 
     */
    public void setValor(String valor) {
        this.valor = valor;
    }
    /**
     * @param tipos 
     */
    public void setTipos(Tipos tipos) {
        this.tipos = tipos;
    }

    enum Tipos {
        CERO ("0"),
        DIGITOS ("[0-9]+"),
        DIGCONCERO ("[0-9]"),
        LETRA ("[a-zA-Z]"),
        CARACTERESPECIALES ("[#|\"|$|%|&|'|(|)|*|+|,|\\|-|.|/|;|<|=|>|?|@|\\|[|]|^|`|\\|{|}|~]"),
        SIGNO ("-"),
        PUNTO("."),
        COMA(","),
        IGUAL("="),
        SALTOLINEA("\n"),
        LLAVECUADRADAABRE("["),
        LLAVECUADRADACIERRA("]"),
        LLAVECORCHETEABRE("{"),
        LLAVECORCHETECIERRA("}"),
        LLAVEPARENTESISABRE("("),
        LLAVEPARENTESISCIERRA(")"),
        FINALEXPRESION(";"),
        APERTURACIERRECOMENTARIOSIMPLES("//"),
        APERTURACOMENTARIOCOMPUESTO("/*"),
        CIERRECOMENTARIOCOMPUESTO("*/"),
        NULL("null"),
        FUNC("func"),
        GLOB("glob"),
        LOC("loc"),
        SEP(":"),
        INICIOFINBLOQUE("_"),
        PARAM("param"),
        NOT("not"),
        READ("read"),
        WRITE("write"),
        COMILLAS("'"),
        COMILLAD("''"),


        OPERADOR ("[+|-|*|/|(|)]") ;

        public final String patron;
        Tipos(String string) {
            this.patron = string;
        }
    }

    
}
