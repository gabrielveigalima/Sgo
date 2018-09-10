/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.PontoDAO;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.CentroCusto;
import model.Colaborador;
import model.Ponto;


/**
 *
 * @author gabriel.lima
 */
public class CtrlPonto {
    
    PontoDAO dao = new PontoDAO();
    public String cadastrarPonto(Ponto p, CentroCusto cc, Colaborador c, String id) throws SQLException{
        return dao.cadastrarPonto(p, cc, c, id);
    }
    public ResultSet listarMes(String id) throws SQLException{
        return dao.listarMes(id);
    }
    
}
