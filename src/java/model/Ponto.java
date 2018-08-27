/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author gabriel.lima
 */
public class Ponto {

    public String getHoraFim() {
        return horaFim;
    }

    public void setHoraFim(String horaFim) {
        this.horaFim = horaFim;
    }
    String date,horaInicio,horaFim,horaExtraInicio,horaExtrafim;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(String horaInicio) {
        this.horaInicio = horaInicio;
    }

    public String getHoraExtraInicio() {
        return horaExtraInicio;
    }

    public void setHoraExtraInicio(String horaExtraInicio) {
        this.horaExtraInicio = horaExtraInicio;
    }

    public String getHoraExtrafim() {
        return horaExtrafim;
    }

    public void setHoraExtrafim(String horaExtrafim) {
        this.horaExtrafim = horaExtrafim;
    }
}
