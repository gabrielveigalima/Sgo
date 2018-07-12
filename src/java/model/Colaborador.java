/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author gabriel.lima
 */
public class Colaborador {
    String nome;
    String matricula;
    String dataInicioCentroCusto;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getDataInicioCentroCusto() {
        return dataInicioCentroCusto;
    }

    public void setDataInicioCentroCusto(String dataInicioCentroCusto) {
        this.dataInicioCentroCusto = dataInicioCentroCusto;
    }
}
