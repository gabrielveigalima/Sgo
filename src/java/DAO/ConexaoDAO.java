/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.*;

/**
 *
 * @author gabriel.lima
 */
public class ConexaoDAO {
    Statement stmt;
    ResultSet rs = null;
    Connection conn = null;
    public static Connection conecta(){
        String r = "\n";
        String connectionUrl = "jdbc:sqlserver://BRRIOAPP3:1433;"
                + "databaseName=SGO;user=sa;password=sapeca";

      // Declare the JDBC objects.  
      Connection con = null;  
      Statement stmt = null;  
      ResultSet rs = null;  

      try {  
         // Establish the connection.  
         Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  
         con = DriverManager.getConnection(connectionUrl);  
      }  

      // Handle any errors that may have occurred.  
      catch (Exception e) {  
         e.printStackTrace();  
      }  
        return con;
    }
}
