package model;
// Generated 18-mar-2018 1:20:12 by Hibernate Tools 4.3.1



/**
 * Parkingspot generated by hbm2java
 */
public class Parkingspot  implements java.io.Serializable {


     private String matricula;
     private String modelo;
     private int horaEntrada;
     private int horaSalida;
     private int tiempoPermitido;

    public Parkingspot() {
    }

    public Parkingspot(String matricula, String modelo, int horaEntrada, int horaSalida, int tiempoPermitido) {
       this.matricula = matricula;
       this.modelo = modelo;
       this.horaEntrada = horaEntrada;
       this.horaSalida = horaSalida;
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
    public int getHoraEntrada() {
        return this.horaEntrada;
    }
    
    public void setHoraEntrada(int horaEntrada) {
        this.horaEntrada = horaEntrada;
    }
    public int getHoraSalida() {
        return this.horaSalida;
    }
    
    public void setHoraSalida(int horaSalida) {
        this.horaSalida = horaSalida;
    }
    public int getTiempoPermitido() {
        return this.tiempoPermitido;
    }
    
    public void setTiempoPermitido(int tiempoPermitido) {
        this.tiempoPermitido = tiempoPermitido;
    }




}


