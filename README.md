# Compilador


# BNF Gramatic
  -----------------------------------------------------------------------------------------------------------------------------------
"Basicos"

cero ::= 0

digito ::= [1-9]

digConCero ::= [0-9]

letra ::= [a-zA-Z]
caracteresEspeciales ::= [#|"|$|%|&|'|(|)|*|+|,|\|-|.|/|;|<|=|>|?|@|\|[|]|^|`|\|{|}|~]
signo := '-'
punto ::= '.'
coma ::= ','
igual ::= '='
saltoLinea ::=  '\n'
llaveCuadradaAbre  ::= '['
llaveCuadradaCierra  ::= ']'
llavesCorcheteAbre ::= '{'
llavesCorcheteCierra ::= '}'
parentesisAbre  ::= '('
parentesisCierra  ::= ')'
finalExpresion ::= ;
aperturaCierreComentarioSimple ::= '//'
aperturaComentarioCompuesto ::= '/*'
cierreComentarioCompuesto ::= '*/'
null ::= 'null'
func ::= 'func'
glob ::= 'glob'
loc ::= 'loc'
sep ::= ':'
inicioFinDeBloque ::= '_'
param ::= 'param'
not ::= 'not'
read ::= 'read'
write ::= 'write'
comillaS ::= '''
comillaD ::= '"'

----------------------------------------------------------------------------------------------------------------------------------------------
"Identificadores" 
Identificador ::= letra (letra|digConCero)*

----------------------------------------------------------------------------------------------------------------------------------------------
"Definicion de tipos"  
tipoFuncion ::=  ‘int’ | ‘bool’ | ‘float’ | ‘char’ | ‘string’ | 'arreglo'
tipoParametro ::= ‘int’ | ‘bool’ | ‘float’ | ‘char’ | ‘string’ | 'arreglo'
tipoVariable ::=  ‘int’ | ‘bool’ | ‘float’ | ‘char’ | ‘string’ | 'arreglo'
tipoArreglo ::= 'int' | 'char'
tipoAlcance ::= 'glob' | 'loc' 

------------------------------------------------------------------------------------------------------------------------------------------------
"Obteción de Valores"

valorNumerico ::= (literal | Identificador | invocarFuncion | expresionBinaria | expresionBinariaUnaria | expresionBinariaUnaria | valorArreglo)
valorLogico::= (literal | Identificador | invocarFuncion | expresionConjuntiva | expresionRelacion | expresionRelaLogi | expresionNegacion)


------------------------------------------------------------------------------------------------------------------------------------------------
"Tipo: int"
int	::= cero | intPositivo | intNegativo
intPositivo ::= digConCero+
intNegativo	::= signo digito+

----------------------------------------------------------------------------------------------------------------------------------------------------------------
"Tipo: float"
float ::= floatCero | floatPositivo | floatNegativo
floatCero ::= cero punto intPositivo
floatPositivo ::= intPositivo punto intPositivo
floatNegativo ::= signo (floatCero | floatPositivo)

-------------------------------------------------------------------------------------------------------------------------------------------------
"Tipo: char"
char ::=  comillaS letra comillaS ‘{’1,1‘}’

### Nota: se define el uso de comillas simples como apartado nuevo 
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
"Tipo: string"
string ::=  comillaD char (char | digConCero | caracteresEspeciales)* comillaD
### Nota: se define el uso de comillas dobles como apartado nuevo 
--------------------------------------------------------------------------------------------------------------------------------------------------
"Tipo: booleano"
bool ::= 'true' | 'false' 

--------------------------------------------------------------------------------------------------------------------------------------------------
"Tipo: Arreglo"
arreglo ::= tipoArreglo sep llaveCuadradaAbre (elementoArreglo coma?)+ llaveCuadradaCierra
elementoArreglo	::= (char|int) 



### Nota para profesor: Consideramos que el uso de la comaOpcional nos permite no general 
produciones adicionales que "alambren" la gramatica como podría ser el siguiente ejemplo
elementoFinal::= elementoArreglo
tipoArreglo sep llaveCuadradaAbre ( (elementoArreglo coma)+ | elementoFinal) llaveCuadradaCierra

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
"Tipo: Comentario"
comentario ::= comentarioLinea | comentarioCompuesto
comentarioLinea ::= aperturaCierreComentarioSimple string aperturaCierreComentarioSimple
comentarioCompuesto ::= aperturaComentarioCompuesto (string saltoLinea*)+ cierreComentarioCompuesto

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
"Tipo: Literal"
literal ::= int|float|string|char|arreglo
literalSinArreglo ::= int|float|string|char

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
"Funciones"
funcion	::= func sep tipoFuncion sep Identificador inicioFinDeBloque bloqueCod inicioFinDeBloque

invocarFuncion ::= Identificador parentesisAbre parentesisCierra 

parametro: (Identificador | literal | expresion | invocarFuncion) coma
parametroFinal: (Identificador | literal | expresion | invocarFuncion)
invocarFuncion ::= Identificador parentesisAbre ( parametro | parametroFinal)+ parentesisCierra


### Nota para profesor: Se crea las producciones de parametro y parametroFinal para que el uso de "?" ya no sea requerido.
----------------------------------------------------------------------------------------------------------------------------------------------------------------
"Programa Principal"
inicio ::= programa
programa ::= func sep tipoFuncion sep 'main' parentesisAbre inicioFinDeBloque bloqueCod inicioFinDeBloque
programa ::= funcion programa
programa ::= funcion
### Nota para profesor: Se arregla el problema de que se encuentren comentarios y sentencias fuera de funciones.

----------------------------------------------------------------------------------------------------------------------------------------------------------------
"Bloques de codigo"
bloqueCod ::= sentencia | estrucControl | return | comentario | ε
bloqueCod ::= (sentencia | estrucControl | comentario) bloqueCod
bloqueCod ::= bloqueCod bloqueCod

### Nota: Se realizaron los cambios de manejo de bloques agregando el ε para evitrar la recursividad
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
"Bloques de codigo en estructuras de control"
bloqueControl ::= bloqueCod | break
bloqueControl ::= bloqueControl bloqueControl

-----------------------------------------------------------------------------------------------------------------------------------------------------------------
"Sentencias"
sentencia ::= crearVariable finalExpresion? 
sentencia ::= crearAsignarVariable
sentencia ::= asignarVariable 
sentencia ::= modificarArreglo 
sentencia ::= sentencia sentencia
sentencia ::= invocarFuncion finalExpresion
sentencia ::= writer 
sentencia ::= reader 
sentencia ::= crearParam
sentencia ::= expresion

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
"Sentencia: Crear Variables"
crearVariable ::= tipoAlcance sep tipoVariable sep Identificador finalExpresion
crearVariable ::= tipoAlcance sep tipoVariable sep Identificador 
### Nota para profesor: Se crearon esta expresión de forma intencional
para mejorar la lectura de gramatica debido a que se utiliza en la produción de "crearAsignarVariable"

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
"Sentencia: Crear Param"
crearParam ::= param sep tipoVariable sep Identificador finalExpresion

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
"Sentencia: Crear y asignar variables"
crearAsignarVariable ::= crearVariable sep Identificador igual ( literal | expresion | Identificador | invocarFuncion | null | valorArreglo ) finalExpresion

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
"Sentencia: Asignar variable"
asignarVariable	::= Identificador igual (literal | expresion | Identificador | invocarFuncion | null | valorArreglo ) finalExpresion

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
"Sentencia: Escribir en salida"
writer ::= write parentesisAbre (literal | string | int | float | valorArreglo ) parentesisCierra finalExpresion

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
"Sentencia: Leer en entrada"
reader ::= read parentesisAbre (Identificador) parentesisCierra finalExpresion

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
"Sentencia: Arreglos"
valorArreglo ::= Identificador llaveCuadradaAbre valorNumerico llaveCuadradaCierra
modificarArreglo Identificador llaveCuadradaAbre valorNumerico llaveCuadradaCierra igual (literal | expresion | invocarFuncion | Identificador | valorArreglo) finalExpresion

----------------------------------------------------------------------------------------------------------------------------------------------------------------
"Estructuras de Control"
estrucControl ::= if | else | switch | while | for 


if	::= 'if' parentesisAbre valorLogico parentesisCierra inicioFinDeBloque bloqueControl inicioFinDeBloque else?
else ::= 'else' inicioFinDeBloque bloqueControl inicioFinDeBloque

switch ::= 'switch' parentesisAbre ( Identificador | expresion | invocarFuncion | literal | valorArreglo ) parentesisCierra  inicioFinDeBloque case inicioFinDeBloque
case ::= ('case' sep (Identificador | expresion | invocarFuncion | literal | valorArreglo) sep inicioFinDeBloque bloqueControl inicioFinDeBloque)+
break ::= 'break' finalExpresion

for ::= 'for' sep Identificador sep 'in' sep range' parentesisAbre valorNumerico parentesisCierra inicioFinDeBloque bloqueControl inicioFinDeBloque
for ::= 'for' sep Identificador sep 'in' sep range' parentesisAbre valorNumerico coma valorNumerico parentesisCierra inicioFinDeBloque bloqueControl inicioFinDeBloque
for ::= 'for' sep Identificador sep 'in' sep range' parentesisAbre valorNumerico coma valorNumerico coma valorNumerico parentesisCierra inicioFinDeBloque bloqueControl inicioFinDeBloque
### Nota para profesor: Se opto por la creación de los 3 posibles casos del for (con uno,dos o 3 valores númericos)
como produciones por separadado.


while ::= 'while' parentesisAbre valorLogico parentesisCierra inicioFinDeBloque bloqueControl inicioFinDeBloque

return	::= 'return' sep (entero | char |  float | bool | invocarFuncion | valorArreglo |ε) finalExpresion
### Nota para profesor: Se incluyó la opción de epsilon en el return para mantenerse fiel a la gramtica establecida por el profesor.

-----------------------------------------------------------------------------------------------------
"Expresiones"
expresion ::= expresionBinaria | expresionUnaria | expresionRelacion | expresionNegacion | expresionConjuntiva | expresionBinariaUnaria | expresionRelaLogi

------------------------------------------------------------------------------------------------------------------------

"Expresion: Expresiones Binarias"
expresionBinaria ::= signo? parentesisAbre valorNumerico operadorBinario valorNumerico parentesisCierra
expresionBinaria ::= signo? parentesisAbre (expresionBinaria|valorNumerico) parentesisCierra operadorBinario signo? parentesisAbre (expresionBinaria | valorNumerico) parentesisCierra
operadorBinario	::= '+'|'-'|'/'|'*'|'%'|'^'

### Nota para profesor: Se elimina el uso de los "?" obligando a utilizarlos debido a que muy probablemente se generan problemas a la hora de saber si un paretensis de cierra iba o no.
-------------------------------------------------------------------------------------------------------------------------
"Expresion: Expresiones Unarias"
expresionUnaria	::= valorNumerico operadorUnarias
expresionUnaria	::= signo valorNumerico
operadorUnarias	::= '--'|'++'

-----------------------------------------------------------------------------------------------------------------------------
"Expresion: Expresiones Relacionales"
expresionRelacion ::= (valorNumerico | valorLogico ) operadorRelacional (valorNumerico | valorLogico )
expresionRelacion ::= (valorNumerico | valorLogico ) operadorComparacion (valorNumerico | valorLogico )
operadorRelacional ::= '>'|'<'|'>='|'<='
operadorComparacion	::= '=='|'!='

### Nota para profesor: Se elimina la produccion que permitia la creación de expresiones relacionales multiples.
---------------------------------------------------------------------------------------------------------------------------------------------------------
"Expresion: Expresiones Logicas"
expresionConjuntiva	::= valorLogico operadorConjuntiva valorLogico
expresionConjuntiva ::= parentesisAbre (expresionConjuntiva| valorLogico ) parentesisCierra operadorConjuntiva parentesisAbre (expresionConjuntiva | valorLogico ) parentesisCierra
operadorConjuntiva	::= '&' | '|'

### Nota para profesor: Se elimina el uso de los "?" obligando a utilizarlos debido a que muy probablemente se generan problemas a la hora de saber si un paretensis de cierra iba o no.
-------------------------------------------------------------------------------------------------------------------------------------------------------
"Expresion: Negacion"
expresionNegacion ::= not parentesisAbre valorLogico parentesisCierra

-------------------------------------------------------------------------------------------------------------------------------------------------------
"Expresion: BinariaUnaria" 
expresionBinariaUnaria ::= signo? parentesisAbre? (expresionBinariaUnaria| expresionUnaria | valorNumerico | expresionBinaria) parentesisCierra? operadorBinario signo? parentesisAbre? (expresionBinariaUnaria | expresionUnaria | valorNumerico | expresionBinaria) parentesisCierra? operadorUnarias? 
operadorBinariaUnaria	::= '+'|'-'|'/'|'*'|'%'|'^'| '--'|'++'

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
"Expresion: Multiple"
expresionMultiple ::= signo? parentesisAbre? (expresionMultiple| expresionBinariaUnaria | expresionBinaria | expresionUnaria | expresionConjuntiva | expresionRelacion | valorNumerico | valorLogico) parentesisCierra? operadorUnarias? operadorMultiple signo? parentesisAbre? (expresionMultiple| expresionBinariaUnaria | expresionBinaria | expresionUnaria | expresionConjuntiva | expresionRelacion | valorNumerico | valorLogico) parentesisCierra? operadorUnarias?
operadorMultiple ::= '>'|'<'|'>='|'<=' | '=='|'!=' | '&' | '|' | '+'|'-'|'/'|'*'|'%'|'^'| '--'|'++'




# Libraries 
  - JFlex
  - JCup 
