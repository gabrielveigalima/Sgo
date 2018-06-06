/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import model.User;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 *
 * @author gabriel.lima
 */
public class UserDAO {
    Connection con =  new ConexaoDAO().conecta();
    Statement stmt;
    PreparedStatement ps;

    
    public User login(User u){
    String email = u.getEmail();
    String pws = u.getPassword();            
    try{
        String sql = "SELECT * FROM tblUser WHERE email=? and password=?";
        ps = con.prepareStatement(sql);        
        ps.setString(1, email);
        ps.setString(2, pws);        
        ResultSet rs = ps.executeQuery();
        if(rs.next()){   
            u.setIdUser(rs.getString("idUser"));
            u.setName(rs.getString("nome"));
            u.setNivel(rs.getString("nivel"));
            u.setStatus(rs.getString("status"));
            u.setStatus(rs.getString("status"));
        }
    }catch (SQLException e){
        e.printStackTrace();
        System.err.println("Erro ao logar: "+e.toString());
        u = null;
    }
    return u;
    }
    
    
     public boolean cadastrar() throws SQLException {
        String sql = "insert into pessoa value(null,?,?,?,?,?,?,?);";
        String query = ("insert into tblUser (nome,nivel,email,password,status,nomeCompleto) "+
                "values(?,?,?,?,?,?)"); 
            
            //Cadastra usuario
            ps = con.prepareStatement(query);
            ps.setString(1, "Gabriel");
            ps.setString(2, "1");
            ps.setString(3, "gabriel.lima@bsm.com.br");
            ps.setString(2, "123");
            ps.setString(3, "1");
            ps.setString(2, "Gabriel Veiga Lima");
           

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
