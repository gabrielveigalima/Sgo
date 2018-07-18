/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.ColaboradorDAO;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.CentroCusto;
import model.Colaborador;

/**
 *
 * @author gabriel.lima
 */
public class CtrlColaborador {
    ColaboradorDAO dao = new ColaboradorDAO();
    Colaborador cola = new Colaborador();
    CentroCusto cc = new CentroCusto();
    public String cadastrarColaborador(Colaborador cola, CentroCusto cc, String id) throws SQLException{
        return dao.cadastrarColaborador(cc, cola, id);
    }
    
    public ResultSet listar(){
        return dao.listar();
    }
    
    public ResultSet selectFiltro(Colaborador c, CentroCusto cc) throws SQLException{
       return dao.selecFiltro(c,cc);
    }
}
