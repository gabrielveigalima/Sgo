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
    long matricula;
    Date dataInicioCentroCusto;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public long getMatricula() {
        return matricula;
    }

    public void setMatricula(long matricula) {
        this.matricula = matricula;
    }

    public Date getDataInicioCentroCusto() {
        return dataInicioCentroCusto;
    }

    public void setDataInicioCentroCusto(Date dataInicioCentroCusto) {
        this.dataInicioCentroCusto = dataInicioCentroCusto;
    }
}
