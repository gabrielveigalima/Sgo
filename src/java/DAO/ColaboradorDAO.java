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
import model.Colaborador;
/**
 *
 * @author gabriel.lima
 */
public class ColaboradorDAO {
    Connection con = new ConexaoDAO().conecta();
    //Equipamento e = new Equipamento();
    
    Statement stmt;
    PreparedStatement ps;
    
    public String mudarStatusColaborador(Colaborador cola) throws SQLException{	
        String r = "";	
        String query = ("UPDATE tblColaborador SET ativo=?  WHERE id=?"); 	
        	
        //Cadastra usuario	
        ps = con.prepareStatement(query);	
        ps.setString(1, "0");	
        ps.setString(2, cola.getId());	
       	
        	
        try {	
            ps.executeUpdate();	
            r = "<div class='bg-success'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Colaborador foi excluido.</h4></div><br>";            	
        } catch (Exception ex) {	
            System.out.println("Erro ao Cadastrar: " + ex.toString());	
           r = "<div class='bg-danger'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Erro ao excluir: " +ex.toString()+".</h4></div><br>";	
        }	
        return r;	
    }
       
    public String editarColaborador(Colaborador cola, CentroCusto cc) throws SQLException{
        String r = "";
        String query = ("UPDATE tblColaborador SET nome=? , matricula=? , "
                + "centroCusto=? , dateInicioCentroCusto=? , ativo=? WHERE id=?"); 
        
        //Cadastra usuario
        ps = con.prepareStatement(query);
        ps.setString(1, cola.getNome());
        ps.setString(2, cola.getMatricula());
        ps.setString(3, cc.getId());
        ps.setString(4, cola.getDataInicioCentroCusto() );
        ps.setString(5, cola.getStatus());
        ps.setString(6, cola.getId()); 


        try {
            ps.executeUpdate();
            r = "<div class='bg-success'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Colaborador foi cadastrado.</h4></div><br>";            
        } catch (Exception ex) {
            System.out.println("Erro ao Cadastrar: " + ex.toString());
           r = "<div class='bg-danger'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Erro ao Cadastrar: " +ex.toString()+".</h4></div><br>";
        }
        return r;
    }
    
    public ResultSet selecFiltro(Colaborador c, CentroCusto cc) throws SQLException{
        ResultSet rs;
        String sql = "SELECT * FROM tblColaborador";
        if(c.getNome() != null && c.getMatricula() != null && cc.getId() != null){
            sql = "SELECT * FROM tblColaborador WHERE nome=? AND matricula=? AND centroCusto=?  ORDER BY id DESC";
            ps = con.prepareStatement(sql);
            ps.setString(1, c.getNome());
            ps.setString(2, c.getMatricula());
            ps.setString(3, cc.getId());
        }else if(c.getNome() != null && c.getMatricula() != null ){
            sql = "SELECT * FROM tblColaborador WHERE nome=? AND matricula=?  ORDER BY id DESC";
            ps = con.prepareStatement(sql);
            ps.setString(1, c.getNome());
            ps.setString(2, c.getMatricula());            
        }else if(c.getNome() != null && cc.getId() != null){
            sql = "SELECT * FROM tblColaborador WHERE nome=? AND centroCusto=?  ORDER BY id DESC";
            ps = con.prepareStatement(sql);
            ps.setString(1, c.getNome());
            ps.setString(2, cc.getId());
        }else if(c.getMatricula() != null && cc.getId() != null){
            sql = "SELECT * FROM tblColaborador WHERE matricula=? AND centroCusto=?  ORDER BY id DESC";
            ps = con.prepareStatement(sql);
            ps.setString(1, c.getMatricula());
            ps.setString(2, cc.getId());
        }else if(c.getNome() != null){
            sql = "SELECT * FROM tblColaborador WHERE nome=?  ORDER BY id DESC ";
            ps = con.prepareStatement(sql);
            ps.setString(1, c.getNome());
           
        }else if(c.getMatricula() != null){
            System.out.println("RESUL: "+c.getMatricula());
            sql = "SELECT * FROM tblColaborador WHERE matricula=?  ORDER BY id DESC";
            ps = con.prepareStatement(sql);
           
            ps.setString(1, c.getMatricula());
            
        }else if( cc.getId() != null){
            System.out.println("RESUL: "+cc.getId());
            sql = "SELECT * FROM tblColaborador WHERE centroCusto=?  ORDER BY id DESC";
            ps = con.prepareStatement(sql);
            ps.setString(1, cc.getId());
        }else if( c.getId() != null){
            sql = "SELECT * FROM tblColaborador WHERE id=?  ORDER BY id DESC";
            ps = con.prepareStatement(sql);
            ps.setString(1, c.getId());
        }else{
            ps = con.prepareStatement(sql);
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
    
    public ResultSet listar(){
        ResultSet rs = null;
        try{
            String sql = "SELECT * FROM tblColaborador WHERE ativo='1'  ORDER BY id DESC";

            ps = con.prepareStatement(sql);     
            rs = ps.executeQuery();
        
        }catch (SQLException e){
            e.printStackTrace();
            System.err.println("Erro ao selecionar Colaborador: "+e.toString());
            rs = null;
        }
        return rs;
    }
    /*
    public ResultSet selectColaboradorAtivo(){
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
    */
    public String cadastrarColaborador(CentroCusto c, Colaborador cola, String id) throws SQLException{
        String r = "";
        String query = ("insert into tblColaborador (nome,matricula,centroCusto,dateInicioCentroCusto,"
                + "dateCreate,userCreate,ativo) "+
                "values(?,?,?,?,?,?,?)"); 
        String timeStamp = new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(Calendar.getInstance().getTime());
        if(!selectColaboradorMatricula(cola.getMatricula())){
            //Cadastra usuario
            System.out.print(timeStamp);
            ps = con.prepareStatement(query);
            ps.setString(1, cola.getNome());
            ps.setString(2, cola.getMatricula());
            ps.setString(3, c.getId());
            ps.setString(4, cola.getDataInicioCentroCusto() );
            ps.setString(5, timeStamp);
            ps.setString(6, id); 
            ps.setString(7, "1");
            
            try {
                ps.executeUpdate();
                r = "<div class='bg-success'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Colaborador foi cadastrado.</h4></div><br>";            
            } catch (Exception ex) {
                System.out.println("Erro ao Cadastrar: " + ex.toString());
               r = "<div class='bg-danger'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Erro ao Cadastrar: " +ex.toString()+".</h4></div><br>";
            }
        }else{
            r = "<div class='bg-danger'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Colaborador já cadastrado. (Matrícula)</h4></div><br>";
        }
    
        return r;
    }
    
    
    public boolean selectColaboradorMatricula(String matricula){
        ResultSet rs;
        try{
            ps = con.prepareStatement("SELECT * FROM tblColaborador where matricula=?  ORDER BY id DESC");
            ps.setString(1, matricula);
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
