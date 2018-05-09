/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.util.Date;

/**
 *
 * @author José Augusto
 */
public class ConverteData {
    public static Date converte(String dataString){
        Date data = new Date();
        
        String dtNascimento[]= dataString.split("/");
        if(dtNascimento.length>0){
            data.setMonth(Integer.parseInt(dtNascimento[1]));
            data.setDate(Integer.parseInt(dtNascimento[0]));
            data.setYear(Integer.parseInt(dtNascimento[2])-1900);
        }
        
        return data;
    }
}
