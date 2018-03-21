/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

public class ParkingFormatted {

    private String matricula;
    private String modelo;
    /* Entrada y salida se guardan como hh:mm, a diferencia de Parking, donde se guardan como en la bbdd 
     */
    private String entrada;
    private String salida;
    private int tiempoPermitido;

    public ParkingFormatted() {
    }

    public ParkingFormatted(String matricula, String modelo, String entrada, String salida, int tiempoPermitido) {
        this.matricula = matricula;
        this.modelo = modelo;
        this.entrada = entrada;
        this.salida = salida;
        this.tiempoPermitido = tiempoPermitido;
    }

    public String getMatricula() {
        return this.matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getModelo() {
        return this.modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getEntrada() {
        return this.entrada;
    }

    public void setEntrada(String entrada) {
        this.entrada = entrada;
    }

    public String getSalida() {
        return this.salida;
    }

    public void setSalida(String salida) {
        this.salida = salida;
    }

    public int getTiempoPermitido() {
        return this.tiempoPermitido;
    }

    public void setTiempoPermitido(int tiempoPermitido) {
        this.tiempoPermitido = tiempoPermitido;
    }

}
