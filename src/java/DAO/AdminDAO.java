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
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
    
    public boolean cadastroUser(User u, String id) throws SQLException{
        String query = ("insert into tblUser (nome,nivel,email,password,status,nomeCompleto,dateCreate,UserCreate,loginLast) "+
                "values(?,?,?,?,?,?,?,?,NULL)"); 
            String timeStamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
            
            //Cadastra usuario
            ps = con.prepareStatement(query);
            ps.setString(1, u.getName());
            ps.setString(2, u.getNivel());
            ps.setString(3, u.getEmail());
            ps.setString(4, u.getPassword());
            ps.setString(5, "1");
            ps.setString(6, u.getNomeCompleto());
            ps.setString(7, timeStamp);
            ps.setString(8, id);
           
        try {
            if (ps.executeUpdate()==1){
                return true;
            }else{
                return false;
            }
        } catch (Exception ex) {
            System.out.println("Erro ao Cadastrar: " + ex.toString());
            return false;
        }  
    }
}
