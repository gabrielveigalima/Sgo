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
    
    public ResultSet selectFiltro(User u) throws SQLException{
        ResultSet rs;
        String sql = "SELECT * FROM tblUser";
        if(u.getName() != null && u.getEmail() != null && u.getNivel() != null){
            sql = "SELECT * FROM tblUser WHERE nome=? AND email=? AND nivel=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getNivel());
        }else if(u.getName() != null && u.getEmail() != null ){
            sql = "SELECT * FROM tblUser WHERE nome=? AND email=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getName());
            ps.setString(2, u.getEmail());            
        }else if(u.getName() != null && u.getNivel() != null){
            sql = "SELECT * FROM tblUser WHERE nome=? AND nivel=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getName());
            ps.setString(2, u.getNivel());
        }else if(u.getEmail() != null && u.getNivel() != null){
            sql = "SELECT * FROM tblUser WHERE email=? AND nivel=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getEmail());
            ps.setString(2, u.getNivel());
        }else if(u.getName() != null){
            sql = "SELECT * FROM tblUser WHERE nome=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getName());
           
        }else if(u.getEmail() != null){
            sql = "SELECT * FROM tblUser WHERE email=?";
            ps = con.prepareStatement(sql);
           
            ps.setString(1, u.getEmail());
            
        }else if( u.getNivel() != null){
            sql = "SELECT * FROM tblUser WHERE nivel=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getNivel());
        }else if( u.getIdUser() != null){
            sql = "SELECT * FROM tblUser WHERE idUser=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getIdUser());
        }
        try{
            rs = ps.executeQuery();
        }catch (SQLException e){
            e.printStackTrace();
            System.err.println("Erro ao pesquisar: "+e.toString());
            rs = null;
        }
        
        return rs;
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
            System.err.println("Erro ao pesquisar: "+e.toString());
            rs = null;
        }
        return rs;
    }
    public boolean selectEmail(String email){
        ResultSet rs;
        try{
            ps = con.prepareStatement("SELECT * FROM tblUser where email=?");
            ps.setString(1, email);
            rs = ps.executeQuery();
            if(rs.next()){
                return true;
            }else{
                return false;
            }
        }catch (SQLException e){
            e.printStackTrace();
            System.err.println("Erro ao pesquisar email: "+e.toString());
            return false;
        }
    }
    
    public String cadastroUser(User u, String id) throws SQLException{
        String r= "";
        String query = ("insert into tblUser (nome,nivel,email,password,status,nomeCompleto,dateCreate,UserCreate,loginLast,recuperar) "+
                "values(?,?,?,?,?,?,?,?,NULL,NULL)"); 
        String timeStamp = new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(Calendar.getInstance().getTime());
        if(!selectEmail(u.getEmail())){
            //Cadastra usuario
            ps = con.prepareStatement(query);
            ps.setString(1, u.getName());
            ps.setString(2, u.getNivel());
            ps.setString(3, u.getEmail());
            ps.setString(4, "123456");
            ps.setString(5, "1");
            ps.setString(6, u.getNomeCompleto());
            ps.setString(7, timeStamp);
            ps.setString(8, id);
           
            try {
                ps.executeUpdate();
                r = "<div class='bg-success'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Cadastro realizado com sucesso.</h4></div><br>";
                
            } catch (Exception ex) {
                System.out.println("Erro ao Cadastrar: " + ex.toString());
                r = "<div class='bg-danger'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Erro ao Cadastrar: " +ex.toString()+".</h4></div><br>";
            }
        }else{
            r = "<div class='bg-danger'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Email já cadastrado.</h4></div><br>";
        }
    return r;    
    }
    
    public String editUser(User u){
        
        ResultSet rs;
        String sql,r = "";
        if(u.getPassword() != null){
            sql = "UPDATE tblUser SET nome=?,nivel=?,email=?,status=?,nomeCompleto=?,password='123456' WHERE idUser=?";
        }else{
            sql = "UPDATE tblUser SET nome=?,nivel=?,email=?,status=?,nomeCompleto=? WHERE idUser=?";
        }
        
        try{
            ps = con.prepareStatement("select * from tblUser WHERE email=?");
            ps.setString(1, u.getEmail());
            rs = ps.executeQuery();
            if(rs.next()){
                String id = rs.getString("idUser");
                if(id.equals(u.getIdUser())){
                    ps = con.prepareStatement(sql);
                    ps.setString(1, u.getName());
                    ps.setString(2, u.getNivel());
                    ps.setString(3, u.getEmail());
                    ps.setString(4, u.getStatus());
                    ps.setString(5, u.getNomeCompleto());
                    ps.setString(6, u.getIdUser());
                    ps.executeUpdate();
                    r = "<div class='bg-success'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Edição realizada com sucesso.</h4></div><br>";
                }else{
                    r = "<div class='bg-danger'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Erro ao Editar: Email é de outro usuário</h4></div><br>";
                } 
            }else{
                            r = "<div class='bg-danger'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Não achou email.</h4></div><br>";

            }
              
        }catch (SQLException e){
            r = "<div class='bg-danger'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Erro ao Editar: " +e.toString()+".</h4></div><br>";
            e.printStackTrace();
            System.err.println("Erro ao : "+e.toString());
        }
        return r;
    }
}
