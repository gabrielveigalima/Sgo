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
import model.Equipamento;
import model.Ponto;

/**
 *
 * @author gabriel.lima
 */
public class PontoDAO {
    
    
    Statement stmt;
    PreparedStatement ps;
    ResultSet rs;
    
    Ponto p = new Ponto();
    Colaborador c = new Colaborador();
    CentroCusto cc = new CentroCusto();
    Equipamento e = new Equipamento();
    
    Connection con = new ConexaoDAO().conecta();
     
    public String cadastrarPonto(Ponto p, CentroCusto cc, Colaborador c, String id) throws SQLException{
        String r = "";
        String ano = new SimpleDateFormat("yyyy").format(Calendar.getInstance().getTime());
        if(!verificaPonto(c.getId(),ano+p.getDate()+"01")){//Verifica se o ponto já foi lançado 
            r = "<div class='bg-danger'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Erro ao Cadastrar ponto: Ponto já registrado.</h4></div><br>"; 
            String query = ("insert into tblHoras (id_colaborador,"
             + "id_centro_custo,"
             + "id_equipamento,"
             + "date,"
             + "hora_inicio,"
             + "hora_fim,"
             + "hora_extra_incio,"
             + "hora_extra_fim,"
             + "id_user_create,date_time_create,id_user_update,date_time_update) "+
             "values(?,?,?,?,?,?,?,?,?,?,?,?)"); 
            String timeStamp = new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(Calendar.getInstance().getTime());
            String diazero = "";

            //Cadastra pontos

            for(int i=1;i<32;i++){//Cadastras todos os 30 ou 31 dias 
                if(i<10){
                    diazero = "0";
                }else{
                    if(diazero != ""){
                        diazero = "";
                    }
                }
                ps = con.prepareStatement(query);
                ps.setString(1, c.getId());
                ps.setString(2, cc.getId());
                if(e.getId() != null){
                    ps.setString(3, e.getId());
                }else{
                    ps.setString(3, null);
                }
                ps.setString(4, ano+p.getDate()+diazero+i);
                ps.setString(5, p.getHoraInicio());
                ps.setString(6, p.getHoraFim()); 
                ps.setString(7, null);
                ps.setString(8, null);
                ps.setString(9, id);
                ps.setString(10, timeStamp);
                ps.setString(11, null);
                ps.setString(12, null);
                try {
                    ps.executeUpdate();
                    r = "<div class='bg-success'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Ponto cadastrado.</h4></div><br>";            
                } catch (Exception ex) {
                    if(!ex.equals("com.microsoft.sqlserver.jdbc.SQLServerException: Conversion failed when converting date and/or time from character string.")){
                        r = "<div class='bg-success'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Ponto cadastrado.</h4></div><br>";       
                    }else{
                        System.err.println("Erro ao Cadastrar: " + ex.toString());
                        r = "<div class='bg-danger'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Erro ao Cadastrar ponto: " +ex.toString()+".</h4></div><br>";
                    }
                }
            }
        }else{
            r = "<div class='bg-danger'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Erro ao Cadastrar ponto: Ponto já lançado.</h4></div><br>";
        }
         
        return r;
    }
    
    public boolean verificaPonto(String id, String data) throws SQLException{
        boolean r = false;
        ps = con.prepareStatement("SELECT id FROM tblHoras WHERE id_colaborador=? AND date=?");
        ps.setString(1, id);
        ps.setString(2, data);
        System.out.println("id: "+id);
        System.out.println("date: "+data);
        try {
            rs = ps.executeQuery();
            if(rs.next()){
                r = true;
                System.out.println("SIMM: ");
            }else{
                r = false; 
                System.out.println("NAOO: ");
            }
        }catch (Exception ex) {
            System.err.println("Erro ao selecionar: " + ex.toString());
            r = false;
        }
        return r; 
    }
}