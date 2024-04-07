import java.io.File; // Clase file para manejar archivos 

/**
 *
 * @author aronm
 * Parte encargada de crear el analizador lexico 
 */

/**
 * Clase encargada de generar el analizador lexico
 * @param ruta
 * @return Analizador lexico
 * @throws IOException
 * @throws Exception
 */
public class Main {
    
    public static void main(String[] args) {
        String ruta = "C:/Users/aronm/Documents/TEC/Compiladores/Proyectos/# 1/Compilador/src/Analizadores/Lexer.Flex";
        generateLexer(ruta);
    }
    public static void generateLexer(String ruta) {
        File archivo = new File(ruta); 
        jflex.Main.generate(archivo);
    }
}
