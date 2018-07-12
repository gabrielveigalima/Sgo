/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.UserDAO;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;

/**
 *
 * @author gabriel.lima
 */
public class CtrlUser {
    UserDAO pessoaDAO = new UserDAO();
    public String cadastrarUser(User user, String id) throws SQLException {
        
        return pessoaDAO.cadastroUser(user, id);
    }
    
    public String editarUser(User user){
        return pessoaDAO.editUser(user);
    }
    
    public ResultSet selecionar(){
        return pessoaDAO.select();
    }
    
    public ResultSet selecionarFiltro(User user) throws SQLException{
        return pessoaDAO.selectFiltro(user);
    }
}
