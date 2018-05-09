/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



/**
 *
 * @author Heleno
 */
public class BD {
    public static Connection getConexao() throws SQLException, ClassNotFoundException{
        Connection conexao=null;
        Class.forName("com.mysql.jdbc.Driver");
        conexao = DriverManager.getConnection("jdbc:mysql://localhost/sca", "root","password");
        return conexao;
    }
}
