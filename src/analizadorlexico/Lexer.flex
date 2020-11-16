/* ========= Indicamos el packete  ==========*/
package analizadorlexico;

/* ========= Importar los tokens de la calse Tokens.java ==========*/
import static analizadorlexico.Tokens.*;

/* ========= Inicializamos la clase Lexer.java ; clase se va a crear cuadno ejecutmees AnalizadoLexico.jva  ==========*/
%%
%class Lexer
%type Tokens
/* ========= Declar la funciones que permiten contar lineas y columnas del anaizador lexico ==========*/
%line
%column
/* ========= Declaramos las gramaticas ==========*/
L=[a-zA-Z_]+
D=[0-9]+
/* =========Excluir algunas gramaticas==========*/
espacio=[ ,\t,\r,\n]+
%{
    /* =========Declaramos las variables globales para poder llamarlas en la interfaz Grafica==========*/
    public String lexeme;
    public int numLinea;
    public int numColumna;
%}
%%
 /* =========ECLARACION DE LAS REGLAS =========*/
 /* =========ECLARACION DE LAS REGLAS =========*/
 /* =========ECLARACION DE LAS REGLAS =========*/
public |
static |
void |
main {numLinea=yyline;numColumna=yycolumn; lexeme=yytext(); return Reservadas;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"=" {numLinea=yyline;numColumna=yycolumn;return Igual;}
";" {numLinea=yyline;numColumna=yycolumn;return Coma;}
"(" {numLinea=yyline;numColumna=yycolumn;return DelimitadorParenIz;}
")" {numLinea=yyline;numColumna=yycolumn;return DelimitadorParenId;}
"{" {numLinea=yyline;numColumna=yycolumn;return DelimitadorIz;}
"}" {numLinea=yyline;numColumna=yycolumn;return DelimitadorId;}
"+" {numLinea=yyline;numColumna=yycolumn;return Suma;}
"-" {numLinea=yyline;numColumna=yycolumn;return Resta;}
"*" {numLinea=yyline;numColumna=yycolumn;return Multiplicacion;}
"/" {numLinea=yyline;numColumna=yycolumn;return Division;}
{L}({L}|{D} )* {lexeme=yytext();numLinea=yyline;numColumna=yycolumn; return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext();numLinea=yyline;numColumna=yycolumn; return Numero;}
 . {return ERROR;}
