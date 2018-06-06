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

         // Create and execute an SQL statement that returns some data.  
         //String SQL = "SELECT TOP 10 * FROM Person.Contact";  
         //stmt = con.createStatement();  
         //rs = stmt.executeQuery(SQL);  
      }  

      // Handle any errors that may have occurred.  
      catch (Exception e) {  
         e.printStackTrace();  
      }  
      finally {  
         //if (rs != null) try { rs.close(); } catch(Exception e) {}  
         //if (stmt != null) try { stmt.close(); } catch(Exception e) {}  
         //if (con != null) try { con.close(); } catch(Exception e) {}  
      }
        /*
        try{
            //conn = new Connection();
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            //conn = DriverManager.getConnection(connectionUrl);
            conn = DriverManager.getConnection(connectionUrl);
            
            //String SQL = "SELECT * FROM dbo.tblUser";
            //stmt = conn.createStatement();
            //rs = stmt.executeQuery(SQL);
            
                
            r += "\nConexao obtida com sucesso!";
            
        }catch(SQLException ex){
            r += "\nSQLexception: "+ ex.getMessage();
            r +="\nSQLState: "+ ex.getSQLState();
            r +="\nVendorError: "+ ex.getErrorCode();
            
            
        } catch(Exception e){
            r = "\nNão foi possível conectar ao banco: "+ e;
            
        }*/
        
        return con;
    }
}
