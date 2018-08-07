/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.CentroCustoDAO;
import DAO.ConexaoDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import model.CentroCusto;

/**
 *
 * @author gabriel.lima
 */
public class CtrlCentroCusto {
    CentroCustoDAO dao = new CentroCustoDAO();
    Connection con =  new ConexaoDAO().conecta();
    Statement stmt;
    PreparedStatement ps;
    
    public String cadastrarCentroCusto(CentroCusto e, String id) throws SQLException{
        return dao.cadastrarCentroCusto(e,id);
    }
    public String editarCentroCustoAtivo(CentroCusto e) throws SQLException{
        return dao.editarCentroCustoAtivo(e);
    }
     
    public ResultSet selecionarCentroCustoAtivo(){
        return dao.selectCentroCustoAtivo();
    }
    
    public ResultSet selecionarCentroCustoId(String id){
        return dao.selectCentroCustoId(id);
    }
    public ResultSet selectFiltro(CentroCusto c){
        return dao.selectFiltro(c);
    } 
    
    public String mudarStatusCC(CentroCusto e) throws SQLException{
        return dao.mudarStatusCc(e);
    }
}
