/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
    
    Ponto p = new Ponto();
    Colaborador c = new Colaborador();
    CentroCusto cc = new CentroCusto();
    Equipamento e = new Equipamento();
    
    Connection con = new ConexaoDAO().conecta();
     
    public String cadastrarPonto(Ponto p, CentroCusto cc, Colaborador c, String id) throws SQLException{
        String r = "";
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
        String data = new SimpleDateFormat("yyyyMMdd").format(Calendar.getInstance().getTime());
            //Cadastra usuario
            System.out.print(timeStamp);
            ps = con.prepareStatement(query);
            ps.setString(1, c.getId());
            ps.setString(2, cc.getId());
            if(e.getId() != null){
                ps.setString(3, e.getId());
            }else{
                ps.setString(3, null);
            }
            ps.setString(4, data );
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
                System.out.println("Erro ao Cadastrar: " + ex.toString());
               r = "<div class='bg-danger'><h4 class='text-center' style='padding-top:10px; padding-bottom:5px'>Erro ao Cadastrar ponto: " +ex.toString()+".</h4></div><br>";
            }
        
    
        return r;
    }
    
    
}
