package codigo;

import static codigo.Tokens.BREAK;
import static codigo.Tokens.COMILLAD;
import static codigo.Tokens.FLOAT;
import static codigo.Tokens.IDENTIFICADOR;
import static codigo.Tokens.INT;
import static codigo.Tokens.Op_binarias;
import static codigo.Tokens.Op_logico;
import static codigo.Tokens.RANGE;
import java.awt.Color;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.StringReader;
import java.nio.file.Files;
import java.util.logging.Level;
import java.util.logging.Logger;
import java_cup.runtime.Symbol;
import javax.swing.JFileChooser;

/**
 *
 
 */
public class FrmPrincipal extends javax.swing.JFrame {

    /**
     * Creates new form FrmPrincipal
     */
    public FrmPrincipal() {
        initComponents();
        this.setLocationRelativeTo(null);
    }
    public static int buscarVariable(String variableABuscar) {
        switch (variableABuscar) {
            case "<DIGITOS>": return 33;
            case "<Op_relacional>": return 20;
            case "<SEP>": return 39;
            case "<LLAVEPARENTESISCIERRA>": return 25;
            case "<Operador booleano>": return 23;
            case "<APERTURACIERRECOMENTARIOSIMPLE>": return 43;
            case "<If>": return 7;
            case "<T_dato>": return 4;
            case "<INT>": return 40;
            case "<Else>": return 8;
            case "<Identificador>": return 32;
            case "<IGUAL>": return 14;
            case "<IN>": return 41;
            case "<CIERRECOMENTARIOCOMPUESTO>": return 37;
            case "<Reservada while>": return 10;
            case "<Division>": return 18;
            case "<Int>": return 5;
            case "<Cadena>": return 6;
            case "<For>": return 11;
            case "<FINALEXPRESION>": return 0;
            case "<P_coma>": return 31;
            case "<COMILLAS>": return 3;
            case "<error>": return 1;
            case "<COMA>": return 35;
            case "<LETRA>": return 32;
            case "<LLAVEPARENTESISABRE>": return 24;
            case "<SALTOLINEA>": return 2;
            case "<LLAVECUADRADACIERRA>": return 29;
            case "<Operador Binario>": return 21; // FALTA, AGREGUELO PORFA AL FLEXCUP PRIMERO
            case "<Op_atribucion>": return 21;
            case "<Do>": return 9;
            case "<ERROR>": return 34;
            case "<Op_logico>": return 19;
            case "<COMILLAD>": return 12;
            case "<PUNTO>": return 38;
            case "<FUNC>": return 13;
            case "<LLAVECORCHETEABRE>": return 26;
            case "<FLOAT>": return 42;
            case "<APERTURACOMENTARIOCOMPUESTO>": return 36;
            case "<Resta>": return 16;
            case "<Multiplicacion>": return 17;
            case "<LLAVECUADRADAABRE>": return 28;
            case "<Op_incremento>": return 22;
            case "<Suma>": return 15;
            case "<Main>": return 30;
            case "<LLAVECORCHETECIERRA>": return 27;
            default: return -1; // Si no se encuentra la variable, se retorna -1
        }
    }
 
    
    private void analizarLexico() throws IOException{
        int cont = 1;
        
        String expr = (String) txtResultado.getText();
        Lexer lexer = new Lexer(new StringReader(expr));
        String resultado = "LINEA " + cont + "\t\t\tSIMBOLO\n";
        String ruta = System.getProperty("user.dir") + "\\src\\codigo\\Resultados.txt";
        while (true) {
            Tokens token = lexer.yylex();
            if (token == null) {
                txtAnalizarLex.setText(resultado);
                System.out.println(resultado);
                
                try {
                    //Creacion de directorio para los resultados 
                    File archivo;
                    
                    archivo = new File (ruta);
                    if(archivo.createNewFile()){
                        System.out.println("Se creo el archivo");
                    }
                    // Escritura del archivo 
                    try {
                        FileWriter escritor = new FileWriter(ruta);
                        BufferedWriter bufferedWriter = new BufferedWriter(escritor);
                        bufferedWriter.write(resultado);
                        bufferedWriter.close();
                        System.out.println("Se ha escrito el texto en el archivo correctamente.");
                        try {
                            // Leer el archivo original
                            FileReader fr = new FileReader(ruta);
                            BufferedReader br = new BufferedReader(fr);
                            String contenido = "";
                            String linea;
                            String primeraLinea = br.readLine();
                            
                            // Leer la primera línea y omitirla
                            //linea = br.readLine();
                   
                            
                            // Leer y agregar el resto del contenido del archivo
                            boolean bandera = true;
                            contenido += "LINEA 1\t\t\t\tSIMBOLO\t\t\tID\n";
                            while ((linea = br.readLine()) != null) {

                                    // Dividir la línea en elementos separados por tabulaciones
                                    String[] elementos = linea.split("\t");

                                    // Verificar el primer elemento de la línea
                                    System.out.println("su largo es"+elementos.length);
                                    if (elementos.length > 0) {
                                        System.out.println("es mayor a 0");
                                        String primerElemento = elementos[0].trim();

                                        // Buscar el valor correspondiente al primer elemento
                                        int Colocare = buscarVariable(primerElemento);
                                        
                                        
                                        // Agregar el token al final de la línea
                                        String lineaConToken = linea + "\t\t\t" + Colocare;

                                        // Agregar la línea modificada al contenido
                                        contenido += lineaConToken + "\n";
                                        System.out.println("se va agregar" + contenido);

                                    
                                   
                                }
                            }
                            
                           
                         
                              
                            br.close();
                            
                            // Escribir el archivo con la primera línea modificada
                            FileWriter fw = new FileWriter(ruta);
                            BufferedWriter bw = new BufferedWriter(fw);
                            bw.write(contenido);
                            bw.close();

                            System.out.println("Se ha modificado la primera línea del archivo correctamente.");

                            } catch (IOException e) {
                                System.out.println("Ha ocurrido un error al modificar la primera línea del archivo.");
                                e.printStackTrace();
                            }


                        
                    } 
  
                    catch (IOException e) {
                        System.out.println("Ha ocurrido un error al escribir en el archivo.");
                        e.printStackTrace();
                    }
                } catch(IOException e) {
                    System.out.println("No se a podido crear el archivo");               
                }
               
   
                return;
            }
            switch (token) {
                case Linea:
                    cont++;
                    resultado += "LINEA " + cont + "\n";
                    break;
                case INT:
                    resultado += "  <INT>\t\t\t" + lexer.lexeme + "\n";
                    break;
                case APERTURACIERRECOMENTARIOSIMPLE:
                    resultado += "  <ACCOMENTARIOS>\t\t\t" + lexer.lexeme + "\n";
                    break;
                case CHAR:
                    resultado += "  <CHAR>\t\t\t" + lexer.lexeme + "\n";
                    break;
                case STRING:
                    resultado += "  <STRING>\t\t\t" + lexer.lexeme + "\n";
                    break;
                case CASE:
                    resultado += "  <CASE>\t\t\t" + lexer.lexeme + "\n";
                    break;
                case RANGE:
                    resultado += "  <RANGE>\t\t\t" + lexer.lexeme + "\n";
                    break;
                case RETURN:
                    resultado += "  <RETURN>\t\t\t" + lexer.lexeme + "\n";
                    break;
                case IN:
                    resultado += "  <IN>\t\t\t" + lexer.lexeme + "\n";
                    break;
                case ARREGLO:
                    resultado += "  <ARREGLO>\t\t\t" + lexer.lexeme + "\n";
                    break;
                case FLOAT:
                    resultado += "  <FLOAT>\t\t\t" + lexer.lexeme + "\n";
                    break;
                case BOOL:
                    resultado += "  <BOOL>\t\t\t" + lexer.lexeme + "\n";
                    break;
                case Cadena:
                    resultado += "  <Tipo de dato>\t\t\t" + lexer.lexeme + "\n";
                    break;
                case T_dato:
                    resultado += "  <Tipo de dato>\t\t\t" + lexer.lexeme + "\n";
                    break;
                case IF:
                    resultado += "  <Reservada if>\t\t" + lexer.lexeme + "\n";
                    break;
                case ELSE:
                    resultado += "  <Reservada else>\t\t" + lexer.lexeme + "\n";
                    break;
                case WHILE:
                    resultado += "  <Reservada while>\t\t" + lexer.lexeme + "\n";
                    break;
                case FOR:
                    resultado += "  <Reservada for>\t\t" + lexer.lexeme + "\n";
                    break;
                case IGUAL:
                    resultado += "  <IGUAL>\t\t\t" + lexer.lexeme + "\n";
                    break;
                case Op_binarias:
                    resultado += "  <Operador binario>\t\t" + lexer.lexeme + "\n";
                    break;
                case Op_unarias:
                    resultado += "  <Operador unario>\t\t" + lexer.lexeme + "\n";
                    break;
                case Op_relacional:
                    resultado += "  <Operador relacional>\t\t" + lexer.lexeme + "\n";
                    break;
                case Op_comparacion:
                    resultado += "  <Operador comparación>\t\t" + lexer.lexeme + "\n";
                    break;
                case Op_logico:
                    resultado += "  <Operador logico>\t\t" + lexer.lexeme + "\n";
                    break;
                case Op_booleano:
                    resultado += "  <Operador booleano>\t\t" + lexer.lexeme + "\n";
                    break;
                case LLAVEPARENTESISABRE:
                    resultado += "  <LLAVEPARENTESISABRE>\t\t" + lexer.lexeme + "\n";
                    break;
                case LLAVEPARENTESISCIERRA:
                    resultado += "  <LLAVEPARENTESISCIERRA>\t" + lexer.lexeme + "\n";
                    break;
                case LLAVECORCHETEABRE:
                    resultado += "  <LLAVECORCHETEABRE>\t\t" + lexer.lexeme + "\n";
                    break;
                case LLAVECORCHETECIERRA:
                    resultado += "  <LLAVECORCHETECIERRA>\t\t" + lexer.lexeme + "\n";
                    break;
                case LLAVECUADRADAABRE:
                    resultado += "  <LLAVECUADRADAABRE>\t\t" + lexer.lexeme + "\n";
                    break;
                case LLAVECUADRADACIERRA:
                    resultado += "  <LLAVECUADRADACIERRA>\t\t" + lexer.lexeme + "\n";
                    break;
                case MAIN:
                    resultado += "  <Reservada main>\t\t" + lexer.lexeme + "\n";
                    break;
                case FINALEXPRESION:
                    resultado += "  <FINALEXPRESION>\t\t" + lexer.lexeme + "\n";
                    break;
                case LETRA:
                    resultado += "  <LETRA>\t\t\t" + lexer.lexeme + "\n";
                    break;
                case DIGITOS:
                    resultado += "  <DIGITOS>\t\t\t" + lexer.lexeme + "\n";
                    break;
                case CERO:
                    resultado += "  <CERO>\t\t\t\n";
                    break;
                case ERROR:
                    resultado += "  <Simbolo no definido>\t\t\t\n";
                    break;
                case DIGCONCERO:
                    resultado += "  <DIGCONCERO>\t\t\t" + lexer.lexeme + "\n";
                    break;
                case CARACTERESPECIALES:
                    resultado += "  <CARACTERESPECIALES>\t\t\t" + lexer.lexeme + "\n";
                    break;
                case SIGNO:
                    resultado += "  <SIGNO>\t\t\t" + lexer.lexeme + "\n";
                    break;
                case PUNTO:
                    resultado += "  <PUNTO>\t\t\t" + lexer.lexeme + "\n";
                    break;
                case COMA:
                    resultado += "  <COMA>\t\t\t" + lexer.lexeme + "\n";
                    break;
                case SALTOLINEA:
                    resultado += "  <SALTOLINEA>\t\t\t" + "salto" + "\n";
                    break;            
                case APERTURACOMENTARIOCOMPUESTO:
                    resultado += "  <APERTURACOMENTARIOCOMPUESTO>\t" + lexer.lexeme + "\n";
                    break;
                case CIERRECOMENTARIOCOMPUESTO:
                    resultado += "  <CIERRECOMENTARIOCOMPUESTO>\t" + lexer.lexeme + "\n";
                    break;
                case NULL:
                    resultado += "  <NULL>\t\t\t" + lexer.lexeme + "\n";
                    break;
                case FUNC:
                    resultado += "  <FUNC>\t\t\t" + lexer.lexeme + "\n";
                    break;
                case GLOB:
                    resultado += "  <GLOB>\t\t\t" + lexer.lexeme + "\n";
                    break;
                case LOC:
                    resultado += "  <LOC>\t\t\t" + lexer.lexeme + "\n";
                    break;
                case SEP:
                    resultado += "  <SEP>\t\t\t" + lexer.lexeme + "\n";
                    break;
                case INICIOFINBLOQUE:
                    resultado += "  <INICIOFINBLOQUE>\t\t" + lexer.lexeme + "\n";
                    break;
                case PARAM:
                    resultado += "  <PARAM>\t\t\t" + lexer.lexeme + "\n";
                    break;
                case NOT:
                    resultado += "  <NOT>\t\t\t" + lexer.lexeme + "\n";
                    break;
                case READ:
                    resultado += "  <READ>\t\t\t" + lexer.lexeme + "\n";
                    break;
                case WRITE:
                    resultado += "  <WRITE>\t\t\t" + lexer.lexeme + "\n";
                    break;
                case COMILLAS:
                    resultado += "  <COMILLAS>\t\t\t" + lexer.lexeme + "\n";
                    break;
                case COMILLAD:
                    resultado += "  <COMILLAD>\t\t\t" + lexer.lexeme + "\n";
                    break;
                case IDENTIFICADOR:
                    resultado += "  <Identificador>\t\t" + lexer.lexeme + "\n";
                    break;
                case BREAK:
                    resultado += "  <BREAK>\t\t\t" + lexer.lexeme + "\n";
                    break;
                case SWITCH:
                    resultado += "  <SWITCH>\t\t\t" + lexer.lexeme + "\n";
                    break;
                default:
                    resultado += "  < " + lexer.lexeme + " >\n";
                    break;
            }
        }    
    }


    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        btnArchivo = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        txtResultado = new javax.swing.JTextArea();
        jScrollPane2 = new javax.swing.JScrollPane();
        txtAnalizarLex = new javax.swing.JTextArea();
        btnAnalizarLex = new javax.swing.JButton();
        btnLimpiarLex = new javax.swing.JButton();
        btnImprimir = new javax.swing.JButton();
        jPanel2 = new javax.swing.JPanel();
        jScrollPane3 = new javax.swing.JScrollPane();
        txtAnalizarSin = new javax.swing.JTextArea();
        btnAnalizarSin = new javax.swing.JButton();
        btnLimpiarSin = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Analizador Lexico", javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 0, 18))); // NOI18N

        btnArchivo.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        btnArchivo.setText("Abrir archivo");
        btnArchivo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnArchivoActionPerformed(evt);
            }
        });

        txtResultado.setColumns(20);
        txtResultado.setRows(5);
        jScrollPane1.setViewportView(txtResultado);

        txtAnalizarLex.setEditable(false);
        txtAnalizarLex.setColumns(20);
        txtAnalizarLex.setRows(5);
        jScrollPane2.setViewportView(txtAnalizarLex);

        btnAnalizarLex.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        btnAnalizarLex.setText("Analizar");
        btnAnalizarLex.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAnalizarLexActionPerformed(evt);
            }
        });

        btnLimpiarLex.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        btnLimpiarLex.setText("Limpiar");
        btnLimpiarLex.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnLimpiarLexActionPerformed(evt);
            }
        });

        btnImprimir.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        btnImprimir.setText("Imprimir");
        btnImprimir.setActionCommand("Imprimir");
        btnImprimir.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnImprimirActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(btnArchivo, javax.swing.GroupLayout.PREFERRED_SIZE, 139, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addContainerGap(319, Short.MAX_VALUE)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(btnImprimir, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(btnLimpiarLex, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(btnAnalizarLex, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 407, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
            .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(jPanel1Layout.createSequentialGroup()
                    .addContainerGap()
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 314, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addContainerGap(386, Short.MAX_VALUE)))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addComponent(btnArchivo)
                        .addGap(74, 74, 74)
                        .addComponent(btnAnalizarLex)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(btnLimpiarLex)
                        .addGap(18, 18, 18)
                        .addComponent(btnImprimir))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(47, 47, 47)
                        .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 344, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(0, 0, Short.MAX_VALUE))
            .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                    .addGap(0, 50, Short.MAX_VALUE)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 341, javax.swing.GroupLayout.PREFERRED_SIZE)))
        );

        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Analizador Sintactico", javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 0, 18))); // NOI18N

        txtAnalizarSin.setEditable(false);
        txtAnalizarSin.setColumns(20);
        txtAnalizarSin.setRows(5);
        jScrollPane3.setViewportView(txtAnalizarSin);

        btnAnalizarSin.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        btnAnalizarSin.setText("Analizar");
        btnAnalizarSin.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAnalizarSinActionPerformed(evt);
            }
        });

        btnLimpiarSin.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        btnLimpiarSin.setText("Limpiar");
        btnLimpiarSin.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnLimpiarSinActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane3)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(btnAnalizarSin)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(btnLimpiarSin))))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnAnalizarSin)
                    .addComponent(btnLimpiarSin))
                .addGap(18, 18, 18)
                .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, 117, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnArchivoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnArchivoActionPerformed
        // TODO add your handling code here:
        JFileChooser chooser = new JFileChooser();
        chooser.showOpenDialog(null);
        File archivo = new File(chooser.getSelectedFile().getAbsolutePath());
        
        try {
            String ST = new String(Files.readAllBytes(archivo.toPath()));
            txtResultado.setText(ST);
        } catch (FileNotFoundException ex) {
            Logger.getLogger(FrmPrincipal.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(FrmPrincipal.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_btnArchivoActionPerformed

    private void btnLimpiarLexActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnLimpiarLexActionPerformed
        // TODO add your handling code here:
        txtAnalizarLex.setText(null);
    }//GEN-LAST:event_btnLimpiarLexActionPerformed

    private void btnLimpiarSinActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnLimpiarSinActionPerformed
        // TODO add your handling code here:
        txtAnalizarSin.setText(null);
    }//GEN-LAST:event_btnLimpiarSinActionPerformed

    private void btnAnalizarLexActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAnalizarLexActionPerformed
        try {      
            analizarLexico();
            String ResultadosAnalisis = txtResultado.getText();
            
            
        } catch (IOException ex) {
            Logger.getLogger(FrmPrincipal.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_btnAnalizarLexActionPerformed

    private void btnAnalizarSinActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAnalizarSinActionPerformed
        // TODO add your handling code here:
        String ST = txtResultado.getText();
        Sintax s = new Sintax(new codigo.LexerCup(new StringReader(ST)));
        
        try {
            s.parse();
            txtAnalizarSin.setText("Analisis realizado correctamente");
            txtAnalizarSin.setForeground(new Color(25, 111, 61));
        } catch (Exception ex) {
            Symbol sym = s.getS();
            txtAnalizarSin.setText("Error de sintaxis. Linea: " + (sym.right + 1) + " Columna: " + (sym.left + 1) + ", Texto: \"" + sym.value + "\"");
            txtAnalizarSin.setForeground(Color.red);
        }
    }//GEN-LAST:event_btnAnalizarSinActionPerformed

    private void btnImprimirActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnImprimirActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_btnImprimirActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(FrmPrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(FrmPrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(FrmPrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(FrmPrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new FrmPrincipal().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAnalizarLex;
    private javax.swing.JButton btnAnalizarSin;
    private javax.swing.JButton btnArchivo;
    private javax.swing.JButton btnImprimir;
    private javax.swing.JButton btnLimpiarLex;
    private javax.swing.JButton btnLimpiarSin;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JTextArea txtAnalizarLex;
    private javax.swing.JTextArea txtAnalizarSin;
    private javax.swing.JTextArea txtResultado;
    // End of variables declaration//GEN-END:variables
}
