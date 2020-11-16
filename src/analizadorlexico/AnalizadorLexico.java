/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package analizadorlexico;

import JFlex.anttask.JFlexTask;
import java.io.File;

/**
 *
 * @author jhonn
 */
public class AnalizadorLexico {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // ruta del archivo Lexer.flex
        String strRutaLexerFlex="C:/Users/jhonn/OneDrive/Documentos/10 MODULO/COMPILADORES/AnalizadorLexico/src/analizadorlexico/Lexer.flex";
        
        crearGeneradorLexico(strRutaLexerFlex);
    }
     public static void crearGeneradorLexico(String ruta){
         File archivo=new File(ruta);
         //ausmaos la clase jflex
         JFlex.Main.generate(archivo);
    }
    
    
}
