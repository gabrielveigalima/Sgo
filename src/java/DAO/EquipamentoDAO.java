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
import model.Equipamento;
/**
 *
 * @author gabriel.lima
 */
public class EquipamentoDAO {
    Connection con = new ConexaoDAO().conecta();
    Equipamento e = new Equipamento();
    
    Statement stmt;
    PreparedStatement ps;
    
    public String cadastrarEquipamneto(Equipamento e, String id) throws SQLException{
        String r = "";
        String query = ("insert into tblEquipamento (nome,dateCreate,userCreate) "+
                "values(?,?,?)"); 
        String timeStamp = new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(Calendar.getInstance().getTime());
        if(!selectName(e.getName().toString())){
            //Cadastra usuario
            System.out.print(timeStamp);
            ps = con.prepareStatement(query);
            ps.setString(1, e.getName());
            ps.setString(2, timeStamp);
            ps.setString(3, id);
           
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
    
    public String mudarStatusE(Equipamento e) throws SQLException{
        String r = "";	
        String query = ("UPDATE tblEquipamento SET ativo=?  WHERE idEquipamneto=?"); 	
        
        //Cadastra usuario	
        ps = con.prepareStatement(query);	
        ps.setString(1, "0");	
        ps.setString(2, e.getId());	
       	
        try {	
            ps.executeUpdate();	
            r = "<div class='bg-success'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Equipamento foi excluido.</h4></div><br>";            	
        } catch (Exception ex) {	
            System.out.println("Erro ao Cadastrar: " + ex.toString());	
           r = "<div class='bg-danger'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Erro ao excluir: " +ex.toString()+".</h4></div><br>";	
        }	
        return r;
    }
    
     public String editarEquipamentoAtivo(Equipamento e) throws SQLException{
        String r = "";	
        String query = ("UPDATE tblEquipamento SET nome=?  WHERE idEquipamneto=?"); 	
        	
        //Cadastra usuario	
        ps = con.prepareStatement(query);	
        ps.setString(1, e.getName());	
        ps.setString(2, e.getId());	
       	
        try {	
            ps.executeUpdate();	
            r = "<div class='bg-success'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Equipamento foi editado.</h4></div><br>";            	
        } catch (Exception ex) {	
            System.out.println("Erro ao Cadastrar: " + ex.toString());	
           r = "<div class='bg-danger'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Erro ao editar: " +ex.toString()+".</h4></div><br>";	
        }	
        return r;
    }
     
    public boolean selectName(String name){
        ResultSet rs;
        try{
            ps = con.prepareStatement("SELECT * FROM tblEquipamento where nome=?");
            ps.setString(1, name);
            rs = ps.executeQuery();
            if(rs.next()){
                return true;
            }else{
                return false;
            }
        }catch (SQLException e){
            e.printStackTrace();
            System.err.println("Erro ao pesquisar equipamento: "+e.toString());
            return false;
        }
    }
    
    public ResultSet selectEquipamentoAtivo(){
        ResultSet rs;
        try{
        String sql = "SELECT * FROM tblEquipamento WHERE ativo=? ORDER BY idEquipamneto DESC";
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
    
    
}
