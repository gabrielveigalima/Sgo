/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import model.User;

/**
 *
 * @author gabriel.lima
 */
public class AdminDAO {
    Connection con =  new ConexaoDAO().conecta();
    Statement stmt;
    PreparedStatement ps;
    public User selectFiltro(User u){
        
        
        return u;
    }
     
    public ResultSet select(){
        User u = new User();
        ResultSet rs;
        try{
            String sql = "SELECT * FROM tblUser";
            ps = con.prepareStatement(sql);       

            rs = ps.executeQuery();
            
        }catch (SQLException e){
            e.printStackTrace();
            System.err.println("Erro ao logar: "+e.toString());
            rs = null;
        }
        return rs;
    }
    
    public boolean cadastroUser(User u) throws SQLException{
        String query = ("insert into tblUser (nome,nivel,email,password,status,nomeCompleto) "+
                "values(?,?,?,?,?,?)"); 
            
            //Cadastra usuario
            ps = con.prepareStatement(query);
            ps.setString(1, u.getName());
            ps.setString(2, u.getNivel());
            ps.setString(3, u.getEmail());
            ps.setString(2, u.getPassword());
            ps.setString(3, "1");
            ps.setString(2, u.getNomeCompleto());
           

            //Busca Pessoa
            //stmt = con.createStatement();
            //ResultSet rs = null;
        try {
            
            
            if (ps.executeUpdate()==1){
                return true;
            }else{
                return false;
            }
            //rs = stmt.executeQuery(query);
            //stmt = con.prepareStatement(query);
            
            
            //stmt.close();
            
        } catch (Exception ex) {
            System.out.println("Erro ao Cadastrar: " + ex.toString());
            return false;
        }  
    }
}
