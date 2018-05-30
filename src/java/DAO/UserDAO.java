/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import model.User;

/**
 *
 * @author gabriel.lima
 */
public class UserDAO {
     public boolean cadastrar(User user) {
        String sqlPessoa = "insert into pessoa value(null,?,?,?,?,?,?,?);";
        String sqlCliente = "insert into cliente value(null,current_date(),?,?);";
/*
        try {

            

            //Cadastra Pessoa
            getConnection();
            stman = connection.prepareStatement(sqlPessoa);
            stman.setString(1, user.getNome());
            stman.setString(3, user.getEmail());
            stman.setString(4, user.getPws());
            stman.execute();
            stman.close();

            //Busca Pessoa
            stman = connection.prepareStatement(""
                    + "select idPessoa from pessoa where cpf = ?;");
            stman.setString(1, cliente.getCpf());
            result = stman.executeQuery();
            result.first();
            cliente.setIdPessoa(result.getLong("idPessoa"));
            result.close();
            stman.close();

            //Cadastra Cliente            
            stman = connection.prepareStatement(sqlCliente);
            //Calendar dtc = Calendar.getInstance();
            //stman.setDate(1, new java.sql.Date(dtc.getTime()));
            stman.setBoolean(1, user.isAtivo());
            stman.setLong(2, user.getIdPessoa());
            stman.execute();
            stman.close();

            return true;
        } catch (SQLException ex) {
            System.out.println("Erro ao Cadastrar: " + ex.toString());
        } finally {
            close();
        } */

        return false;
    }
}
