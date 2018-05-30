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
    Statement stmt = null;
    ResultSet rs = null;
    
    public static String conecta(){
        String r = "\n";
        String connectionUrl = "jdbc:sqlserver://BRRIOAPP3:4040;"
                + "databaseName=SGO;integratedSecurity=true;";
        
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            Connection conn = DriverManager.getConnection(connectionUrl,"sa","sapeca");
            
            String SQL = "SELECT * FROM dbo.tblUser";
            stmt = conn.createStatement()
            rs = stmt.executeQuery(SQL);
            
                
            r += "\nConexao obtida com sucesso!";
            
        }catch(SQLException ex){
            r += "\nSQLexception: "+ ex.getMessage();
            //r +="\nSQLState: "+ ex.getSQLState();
            //r +="\nVendorError: "+ ex.getErrorCode();
            
            
        } catch(Exception e){
            r = "\nNão foi possível conectar ao banco: "+ e;
            
        }
        
        return r;
    }
}
