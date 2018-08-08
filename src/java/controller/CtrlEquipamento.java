/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.EquipamentoDAO;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Equipamento;

/**
 *
 * @author gabriel.lima
 */
public class CtrlEquipamento {
    EquipamentoDAO dao = new EquipamentoDAO();
     public String cadastrarEquipamneto(Equipamento e, String id) throws SQLException{
        return dao.cadastrarEquipamneto(e,id);
    }
     
    public ResultSet selecionarEquipamnetoAtivo(){
        return dao.selectEquipamentoAtivo();
    }
    
    public String editarEquipamentoAtivo(Equipamento e) throws SQLException{
        return dao.editarEquipamentoAtivo(e);
    }
    public String mudarStatusE(Equipamento e) throws SQLException{
        return dao.mudarStatusE(e);
    }
}
