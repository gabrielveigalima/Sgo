/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.UserDAO;
import model.User;

/**
 *
 * @author gabriel.lima
 */
public class CtrlUser {
    
    public boolean cadastrarUser(User user) {
        UserDAO pessoaDAO = new UserDAO();
        return pessoaDAO.cadastrar(user);
    } 
}
