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
import model.CentroCusto;
/**
 *
 * @author gabriel.lima
 */
public class CentroCustoDAO {
    Connection con = new ConexaoDAO().conecta();
    //Equipamento e = new Equipamento();
    
    Statement stmt;
    PreparedStatement ps;
    
            
    public ResultSet selectFiltro(CentroCusto c){
        ResultSet rs;
        try{
        String sql = "SELECT * FROM tblCentroCusto WHERE nome=? ";
        ps = con.prepareStatement(sql);        
        ps.setString(1, c.getName());
                
        rs = ps.executeQuery();
        
        }catch (SQLException e){
            e.printStackTrace();
            System.err.println("Erro ao selecionar Centro de custo pelo ID: "+e.toString());
            rs = null;
        }
        
        return rs;
    }
    
    public ResultSet selectCentroCustoId(String id){
        ResultSet rs;
        try{
        String sql = "SELECT * FROM tblCentroCusto WHERE id=? ";
        ps = con.prepareStatement(sql);        
        ps.setString(1, id);
                
        rs = ps.executeQuery();
        
        }catch (SQLException e){
            e.printStackTrace();
            System.err.println("Erro ao selecionar Centro de custo pelo ID: "+e.toString());
            rs = null;
        }
        
        return rs;
    }
    
    public ResultSet selectCentroCustoAtivo(){
        ResultSet rs;
        try{
        String sql = "SELECT * FROM tblCentroCusto WHERE ativo=? ";
        ps = con.prepareStatement(sql);        
        ps.setString(1, "1");
                
        rs = ps.executeQuery();
        
        }catch (SQLException e){
            e.printStackTrace();
            System.err.println("Erro ao selecionar Centro de custo: "+e.toString());
            rs = null;
        }
        
        return rs;
    }
    
    public String cadastrarCentroCusto(CentroCusto c, String id) throws SQLException{
        String r = "";
        String query = ("insert into tblCentroCusto (nome,dateCreate,userCreate,ativo,intinere) "+
                "values(?,?,?,?,?)"); 
        String timeStamp = new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(Calendar.getInstance().getTime());
        if(!selectCentroCustoName(c.getName().toString())){
            //Cadastra usuario
            System.out.print(timeStamp);
            ps = con.prepareStatement(query);
            ps.setString(1, c.getName());
            ps.setString(2, timeStamp);
            ps.setString(3, id);
            ps.setString(4, "1");
            if(c.getIntinere().equals("")){
                ps.setString(5,"NULL");
            }else{
                ps.setString(5, c.getIntinere());
            }
            try {
                ps.executeUpdate();
                r = "<div class='bg-success'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Equipamento foi cadastrado.</h4></div><br>";            
            } catch (Exception ex) {
                System.out.println("Erro ao Cadastrar: " + ex.toString());
               r = "<div class='bg-danger'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Erro ao Cadastrar: " +ex.toString()+".</h4></div><br>";
            }
        }else{
            r = "<div class='bg-danger'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Equipamento já cadastrado.</h4></div><br>";
        }
    
        return r;
    }
    
    
    public boolean selectCentroCustoName(String name){
        ResultSet rs;
        try{
            ps = con.prepareStatement("SELECT * FROM tblCentroCusto where nome=?");
            ps.setString(1, name);
            rs = ps.executeQuery();
            if(rs.next()){
                return true;
            }else{
                return false;
            }
        }catch (SQLException e){
            e.printStackTrace();
            System.err.println("Erro ao pesquisar centro de custo: "+e.toString());
            return false;
        }
    }  
}
